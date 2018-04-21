from __future__ import print_function

'''Simple Myo ROS Module

This script provides EMG, IMU and Gesture data from the Myo Band to ROS.
This script is based on the myo-raw project - especially on the myo_raw.py
file. (see https://github.com/dzhu/myo-raw/ which is available under the MIT
LICENSE)
Following changes where made:
  - ros code added
  - removed code for myo firmware < 1.0
  - removed pygame stuff to keep it compact

usage: python myo_ros.py

provides:
  - publishes data in topics: /myo/data/...
  - subscribes to: /myo/vibrate

# at the moment only one myo should be used.
'''

# Original Includes
import re, struct, sys, threading, time, struct

import serial
from serial.tools.list_ports import comports

# Ros libraries
import roslib
import rospy

# quarternion, acc, gyro, movement, emg, gesture
from geometry_msgs.msg import Quaternion, Vector3
from std_msgs.msg import Int32, Int32MultiArray, String
import std_srvs.srv


VERBOSE=False
DEBUG=False

def pack(fmt, *args):
  return struct.pack('<' + fmt, *args)

def unpack(fmt, *args):
  return struct.unpack('<' + fmt, *args)

def multichr(ords):
    if sys.version_info[0] >= 3:
        return bytes(ords)
    else:
        return ''.join(map(chr, ords))

def multiord(b):
    if sys.version_info[0] >= 3:
        return list(b)
    else:
        return map(ord, b)

class ROSNode:
  def __init__(self):
    '''Initialize ros publisher, ros subscriber'''
    # publish and subscribers.

    self.vibrate = 0
    self.pub_emg = rospy.Publisher("/myo/data/emg", Int32MultiArray, queue_size=1)
    self.pub_acceleration = rospy.Publisher("/myo/data/imu_acceleration", Vector3, queue_size=1)
    self.pub_gyroscope = rospy.Publisher("/myo/data/imu_gyroscope", Vector3, queue_size=1)
    self.pub_quaternion = rospy.Publisher("/myo/data/imu_quaternion", Quaternion, queue_size=1)
    self.pub_gesture = rospy.Publisher("/myo/data/thalmic_gesture", Int32, queue_size=1)
    self.pub_slip = rospy.Publisher("/myo/data/moving_slip", Int32, queue_size=1)
    self.pub_vibrate = rospy.Subscriber("/myo/vibrate", Int32, self.callback_vibrate,  queue_size = 1)
    rospy.init_node('myo', anonymous=True)

  def callback_vibrate(self,ros_data):
    self.vibrate = ros_data.data
    return 0



class Packet(object):
    def __init__(self, ords):
        self.typ = ords[0]
        self.cls = ords[2]
        self.cmd = ords[3]
        self.payload = multichr(ords[4:])

    def __repr__(self):
        return 'Packet(%02X, %02X, %02X, [%s])' % \
            (self.typ, self.cls, self.cmd,
             ' '.join('%02X' % b for b in multiord(self.payload)))


class BT(object):
    '''Implements the non-Myo-specific details of the Bluetooth protocol.'''
    def __init__(self, tty):
        self.ser = serial.Serial(port=tty, baudrate=9600, dsrdtr=1)
        self.buf = []
        self.lock = threading.Lock()
        self.handlers = []

    ## internal data-handling methods
    def recv_packet(self, timeout=None):
        t0 = time.time()
        self.ser.timeout = None
        while timeout is None or time.time() < t0 + timeout:
            if timeout is not None: self.ser.timeout = t0 + timeout - time.time()
            c = self.ser.read()
            if not c: return None

            ret = self.proc_byte(ord(c))
            if ret:
                if ret.typ == 0x80:
                    self.handle_event(ret)
                return ret

    def recv_packets(self, timeout=.5):
        res = []
        t0 = time.time()
        while time.time() < t0 + timeout:
            p = self.recv_packet(t0 + timeout - time.time())
            if not p: return res
            res.append(p)
        return res

    def proc_byte(self, c):
        if not self.buf:
            if c in [0x00, 0x80, 0x08, 0x88]:
                self.buf.append(c)
            return None
        elif len(self.buf) == 1:
            self.buf.append(c)
            self.packet_len = 4 + (self.buf[0] & 0x07) + self.buf[1]
            return None
        else:
            self.buf.append(c)

        if self.packet_len and len(self.buf) == self.packet_len:
            p = Packet(self.buf)
            self.buf = []
            return p
        return None

    def handle_event(self, p):
        for h in self.handlers:
            h(p)

    def add_handler(self, h):
        self.handlers.append(h)

    def remove_handler(self, h):
        try: self.handlers.remove(h)
        except ValueError: pass

    def wait_event(self, cls, cmd):
        res = [None]
        def h(p):
            if p.cls == cls and p.cmd == cmd:
                res[0] = p
        self.add_handler(h)
        while res[0] is None:
            self.recv_packet()
        self.remove_handler(h)
        return res[0]

    ## specific BLE commands
    def connect(self, addr):
        return self.send_command(6, 3, pack('6sBHHHH', multichr(addr), 0, 6, 6, 64, 0))

    def get_connections(self):
        return self.send_command(0, 6)

    def discover(self):
        return self.send_command(6, 2, b'\x01')

    def end_scan(self):
        return self.send_command(6, 4)

    def disconnect(self, h):
        return self.send_command(3, 0, pack('B', h))

    def read_attr(self, con, attr):
        self.send_command(4, 4, pack('BH', con, attr))
        return self.wait_event(4, 5)

    def write_attr(self, con, attr, val):
        self.send_command(4, 5, pack('BHB', con, attr, len(val)) + val)
        return self.wait_event(4, 1)

    def send_command(self, cls, cmd, payload=b'', wait_resp=True):
        s = pack('4B', 0, len(payload), cls, cmd) + payload
        self.ser.write(s)

        while True:
            p = self.recv_packet()

            ## no timeout, so p won't be None
            if p.typ == 0: return p

            ## not a response: must be an event
            self.handle_event(p)


class MyoRaw(object):
    '''Implements the Myo-specific communication protocol.'''

    def __init__(self, tty=None):
        if tty is None:
            tty = self.detect_tty()
        if tty is None:
            raise ValueError('Myo dongle not found!')

        self.bt = BT(tty)
        self.rn = ROSNode()
        self.INITIALIZED = False
        self.arm = 0
        self.conn = None

    def detect_tty(self):
        for p in comports():
            if re.search(r'PID=2458:0*1', p[2]):
                rospy.loginfo("Using Myo", p[0])
                return p[0]

        return None

    def run(self, timeout=None):
        self.bt.recv_packet(timeout)

    def connect(self):
        ## stop everything from before
        self.bt.end_scan()
        self.bt.disconnect(0)
        self.bt.disconnect(1)
        self.bt.disconnect(2)

        ## start scanning
        rospy.loginfo("Scanning for Myo")
        self.bt.discover()
        while True:
            p = self.bt.recv_packet()
            if DEBUG:
              print("Scan response:", p)

            if p.payload.endswith(b'\x06\x42\x48\x12\x4A\x7F\x2C\x48\x47\xB9\xDE\x04\xA9\x01\x00\x06\xD5'):
                addr = list(multiord(p.payload[2:8]))
                break
        self.bt.end_scan()

        ## connect and wait for status event
        conn_pkt = self.bt.connect(addr)
        self.conn = multiord(conn_pkt.payload)[-1]
        self.bt.wait_event(3, 0)

        ## get firmware version
        fw = self.read_attr(0x17)
        _, _, _, _, v0, v1, v2, v3 = unpack('BHBBHHHH', fw.payload)
        rospy.loginfo('firmware version:  %d.%d.%d.%d' % (v0, v1, v2, v3))

        name = self.read_attr(0x03)
        rospy.loginfo('Device name:  %s' % name.payload)

        ## enable IMU data
        self.write_attr(0x1d, b'\x01\x00')
        ### enable on/off arm notifications
        self.write_attr(0x24, b'\x02\x00')

        self.start_raw()


        ## add data handlers
        def handle_data(p):
            if DEBUG:
              print("P_DATA",p)
            if (p.cls, p.cmd) != (4, 5): return

            c, attr, typ = unpack('BHB', p.payload[:4])
            pay = p.payload[5:]
            #if(attr != 28) :
            #  print("Attribute:", attr)
            if attr == 0x27:
              if self.INITIALIZED:
                vals = unpack('8HB', pay)
                ## not entirely sure what the last byte is, but it's a bitmask that
                ## seems to indicate which sensors think they're being moved around or
                ## something
                emg_buf = Int32MultiArray()
                emg = vals[:8]
                for i in emg:
                  emg_buf.data.append(i)
                moving = vals[8]
                self.rn.pub_emg.publish(emg_buf)
                self.rn.pub_slip.publish(moving)
            elif attr == 0x1c:
              if self.INITIALIZED:
                vals = unpack('10h', pay)
                quat = vals[:4]
                acc = vals[4:7]
                gyro = vals[7:10]
                self.rn.pub_quaternion.publish(quat[0],quat[1],quat[2],quat[3])
                self.rn.pub_acceleration.publish(acc[0],acc[1],acc[2])
                self.rn.pub_gyroscope.publish(gyro[0],gyro[1],gyro[2])
            elif attr == 0x23:
                typ, val, xdir = unpack('3B', pay)
                if DEBUG:
                  print("Typ:",typ) # 1: on arm , 2: removed, 3: recognized action: from 0 to 5 (255 unknown):
                  print("Val:",val) # 2 LEFT, 1 RIGHT, 0 Unknown
                  print("Dir:",xdir)
                if typ == 1: # on arm
                  # initialized on left arm
                  rospy.loginfo("Myo Initialized")
                  self.INITIALIZED=True
                  if val == 1:
                    ARM=1
                    rospy.loginfo("detected Myo on your right arm...")
                  elif val == 2:
                    ARM=2
                    rospy.loginfo("detected Myo on your left arm...")
                elif typ == 2 and self.INITIALIZED: # removed from arm - publish unknown gesture and reset initialize
                  self.rn.pub_gesture.publish(255)
                  rospy.loginfo("Myo removed from Arm - put it on again and make the initialization gesture")
                  self.INITIALIZED=False
                elif typ == 3 and self.INITIALIZED: # publish gesture from thalmic gesture recognition
                  self.rn.pub_gesture.publish(int(val))
                  # ubuntu 12.04 has problems with the python enum package - can't access names. (removed Class Pose)
                  if VERBOSE:
                    rospy.loginfo("Detected gesture %s" % str(val))
            else:
                rospy.loginfo('data with unknown attr: %02X %s' % (attr, p))

        self.bt.add_handler(handle_data)


    def write_attr(self, attr, val):
        if self.conn is not None:
            self.bt.write_attr(self.conn, attr, val)

    def read_attr(self, attr):
        if self.conn is not None:
            return self.bt.read_attr(self.conn, attr)
        return None

    def disconnect(self):
        if self.conn is not None:
            self.bt.disconnect(self.conn)

    def start_raw(self):
        '''Sending this sequence for v1.0 firmware seems to enable both raw data and
        pose notifications.
        '''
        self.write_attr(0x28, b'\x01\x00')
        self.write_attr(0x19, b'\x01\x03\x01\x01\x00')
        self.write_attr(0x19, b'\x01\x03\x01\x01\x01')


    def vibrate(self, length):
        if length in xrange(1, 4):
            ## first byte tells it to vibrate; purpose of second byte is unknown
            self.write_attr(0x19, pack('3B', 3, 1, length))


if __name__ == '__main__':
  m = MyoRaw(sys.argv[1] if len(sys.argv) >= 2 else None)
  m.connect()
  try:
    while not rospy.is_shutdown():
      m.run(1)
      if m.rn.vibrate > 0:
        rospy.loginfo("Vibrating")
        m.vibrate(m.rn.vibrate)
        m.rn.vibrate=0
  except KeyboardInterrupt:
    pass
  finally:
    m.disconnect()
    print()

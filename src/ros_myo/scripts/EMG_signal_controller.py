#!/usr/bin/env python

import rospy
import math
import numpy
from ros_myo.msg import MyoArm, MyoPose, EmgArray
from std_msgs.msg import String


def get_emg_array(msg):
    emg_data = numpy.array(list(msg.data))
    rospy.loginfo('EMG data: {}'.format(emg_data))

def get_gest(msg):
    gesture = msg.data
    rospy.loginfo('gesture: {}'.format(gesture))

def main():
    rospy.init_node('EMG_signal_controller',anonymous=True)
    #pub = rospy.Publisher('/finger_position', JointState)
    #monitor = FingerPosition(pub)
    rospy.Subscriber("/myo_raw/myo_emg", EmgArray, get_emg_array)
    rospy.Subscriber("/myo_raw/myo_gest_str", String, get_gest)
    rospy.spin()

if __name__ == '__main__':
    main()

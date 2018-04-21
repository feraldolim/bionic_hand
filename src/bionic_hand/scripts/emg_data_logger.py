#!/usr/bin/env python

import rospy
import math
import numpy
from bionic_hand.msg import MyoArm, MyoPose, EmgArray
from std_msgs.msg import String

# Initialize global variables
flag = 0
counter = 1
array = numpy.zeros(8)

def save_array(gestures,duration,filter_flag):
    global flag, array, counter

    # Separate file directories for filtered and unfiltered data
    if filter_flag == 1:
        save_dir = "/home/feraldo/ROS_ws/bionic_hand_ws/data/filtered/emg_array_{}.csv"
        gest_size_dir = "/home/feraldo/ROS_ws/bionic_hand_ws/data/filtered/gesture_size.csv"
    elif filter_flag == 0:
        save_dir = "/home/feraldo/ROS_ws/bionic_hand_ws/data/unfiltered/emg_array_{}.csv"
        gest_size_dir = "/home/feraldo/ROS_ws/bionic_hand_ws/data/unfiltered/gesture_size.csv"

    # Save the number of gestures into a csv file to be used for training and evaluation
    numpy.savetxt((gest_size_dir), [gestures-1])

    # Delay 5 seconds while waiting for Myo to connect
    rospy.sleep(5)

    # Start logging EMG data from here
    for i in range(0,gestures):
        print ("{} {}.{}".format("    Waiting. Prepare for gesture", counter, "\n    Starting in 5 seconds."))
        rospy.sleep(5)
        print ("Start recording now.")

        flag = 1
        rospy.sleep(duration)

        print ("{} {}.".format("    Done recording for gesture", counter))
        rospy.sleep(1)

        # Save the logged EMG data into csv files
        numpy.savetxt((save_dir.format(counter)), array, delimiter=",")

        flag = 0
        counter += 1

        # Recycle the array's contents to start logging another gesture's data
        array = numpy.zeros(8)

    # Exit the process when data logging is finished
    print 'Done.'
    rospy.signal_shutdown('done.')

def get_emg_array(msg):
    global array

    # Convert EMG data into numpy array
    emg_data = numpy.array(list(msg.data))

    # When data logger is ready, populate array with EMG data
    if flag == 1:
        array = numpy.vstack((array, emg_data))
    #rospy.loginfo('EMG data: {}'.format(emg_data))

def main():
    rospy.init_node('EMG_data_logger',anonymous=True)

    # Take parameters from launch file
    num_gest = rospy.get_param('~num_gest')
    dur = rospy.get_param('~dur')
    EMG_log_flag = rospy.get_param('~EMG_log_flag')
    filter_flag = rospy.get_param('~filter_flag')

    # Subscribe to Myo's EMG data stream
    rospy.Subscriber("/myo_raw/myo_emg", EmgArray, get_emg_array)

    # To make sure everything is correct, protect data logger function with if clause.
    # This is to avoid accidental data overwrites.
    if EMG_log_flag:
        save_array(num_gest,dur,filter_flag)

    rospy.spin()

if __name__ == '__main__':
    main()

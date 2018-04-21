#!/usr/bin/env python

import rospy
import math
import numpy
from numpy import genfromtxt
from oct2py import octave
from bionic_hand.msg import MyoArm, MyoPose, EmgArray
from std_msgs.msg import String

# Initialize empty variables and Octave file directory.
PCA_dir = ''
gesture_size = ''
range_E = ''
octave.addpath('/home/feraldo/ROS_ws/bionic_hand_ws/data/')

def get_emg_array(msg):
    # Evaluate the EMG gestures using PCA on Octave
    emg_data = numpy.array(list(msg.data))
    gesture = octave.evaluatePCA(PCA_dir,emg_data,gesture_size,range_E)
    print gesture

def main():
    global PCA_dir, gesture_size,range_E

    rospy.init_node('PCA_classifier',anonymous=True)

    # Get parameters from launch file
    PCA_dir = rospy.get_param('~dir')
    gest_dir = rospy.get_param('~gest_size_dir')
    range_dir = rospy.get_param('~range_dir')

    # Get size of gesture and the chosen eigenvectors' range from csv file
    gesture_size = genfromtxt(gest_dir)
    range_E = genfromtxt(range_dir,delimiter=',')

    # Subscribe to Myo's EMG data stream
    rospy.Subscriber("/myo_raw/myo_emg", EmgArray, get_emg_array)

    rospy.spin()

if __name__ == '__main__':
    main()

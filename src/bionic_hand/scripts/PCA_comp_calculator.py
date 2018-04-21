#!/usr/bin/env python

import rospy
import math
import numpy
from oct2py import octave

def get_PCA(threshold, filter_flag):
    # Add data path into Octave as reference
    octave.addpath('/home/feraldo/ROS_ws/bionic_hand_ws/data/')

    # Get PCA components using Octave
    E, Cy = octave.get_PCA_comp(threshold,filter_flag,nout = 2)
    #print E,Cy

    # Exit the process after calculations are complete.
    print 'Done.'
    rospy.signal_shutdown('done.')

def main():
    rospy.init_node('PCA_component_calculator',anonymous=True)

    # Get parameters from launch file
    threshold = rospy.get_param('~threshold')
    filter_flag = rospy.get_param('~filter_flag')

    # Run PCA computation function
    get_PCA(threshold, filter_flag)

    rospy.spin()

if __name__ == '__main__':
    main()

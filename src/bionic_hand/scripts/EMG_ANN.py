#!/usr/bin/env python

import tensorflow as tf
import numpy as np
from numpy import genfromtxt
import scipy.io as scipy
from time import time
from datetime import datetime
from oct2py import octave
import rospy
import math
import numpy
from bionic_hand.msg import MyoArm, MyoPose, EmgArray
from std_msgs.msg import String

# Initialize values for counting results and output them
counter = 0
predicted_class_last = 99
array = np.zeros(150)
predicted_class = np.zeros(shape=1, dtype=np.int)

def main():
    # Initialize rosnode
    rospy.init_node('ANN_classifier',anonymous=True)

    def model(_NUM_CLASSES):
        # Placeholder for input data x and y
        with tf.name_scope('data'):
            # Size of x: 1x8, 2 dimensional array (vector)
            # EMG channels from Myo: 8
            x = tf.placeholder(tf.float32, shape=[None, 8], name='Input')
            y = tf.placeholder(tf.float32, shape=[None, _NUM_CLASSES], name='Output')
        # Store layers weight & bias from parameters
        input_neurons = rospy.get_param('~input_n')
        hidden1_neurons = rospy.get_param('~hidden1_n')
        hidden2_neurons = rospy.get_param('~hidden2_n')
        # Assign tensorflow weights and biases model
        weights = {
            'h1': tf.Variable(tf.random_normal([8, input_neurons])),
            'h2': tf.Variable(tf.random_normal([input_neurons, hidden1_neurons])),
            'h3': tf.Variable(tf.random_normal([hidden1_neurons, hidden2_neurons])),
            'out': tf.Variable(tf.random_normal([hidden2_neurons, _NUM_CLASSES]))
        }
        biases = {
            'b1': tf.Variable(tf.random_normal([input_neurons])),
            'b2': tf.Variable(tf.random_normal([hidden1_neurons])),
            'b3': tf.Variable(tf.random_normal([hidden2_neurons])),
            'out': tf.Variable(tf.random_normal([_NUM_CLASSES]))
        }
        # Input layer
        layer_1 = tf.add(tf.matmul(x, weights['h1']), biases['b1'])
        layer_1 = tf.nn.relu(layer_1)
        # 1st hidden layer
        layer_2 = tf.add(tf.matmul(layer_1, weights['h2']), biases['b2'])
        layer_2 = tf.nn.relu(layer_2)
        # 2nd hidden layer
        layer_3 = tf.add(tf.matmul(layer_2, weights['h3']), biases['b3'])
        layer_3 = tf.nn.relu(layer_3)
        # Define a dropout at 2nd hidden layer, with probability of 0.5%
        layer_3 = tf.nn.dropout(layer_3, 0.5)
        # Output layer, consists of 7 neurons (7 classes)
        output = tf.add(tf.matmul(layer_3, weights['out']), biases['out'], name="output")
        # Initiate global step as 0.
        global_step = tf.Variable(initial_value=0, name='global_step', trainable=False)
        # Save Y output from NN model as the argument for supervised training
        y_pred_cls = tf.argmax(output, dimension=1)
        return x, y, output, global_step, y_pred_cls

    # Get gesture size path, filter flag, and save path
    gest_size_dir = rospy.get_param('~gest_size_dir')
    filter_flag = rospy.get_param('~filter_flag')
    _SAVE_PATH = rospy.get_param('~save_path')
    # Get gesture size and import NN model
    gesture_size = int(genfromtxt(gest_size_dir)) + 1
    x, y, output, global_step, y_pred_cls = model(gesture_size)
    # Handler to save checkpoint summary to savepath directory
    saver = tf.train.Saver()
    sess = tf.Session()

    # Try to restore last ANN training checkpoint from save path
    try:
        print("Trying to restore last checkpoint ...")
        last_chk_path = tf.train.latest_checkpoint(checkpoint_dir=_SAVE_PATH)
        saver.restore(sess, save_path=last_chk_path)
    except:
        print("Failed to restore checkpoint. Train the ANN first.")
        rospy.signal_shutdown('Done with errors.')

    def get_emg_array(msg):
        global counter, predicted_class_last, array
        # Populate the array with incoming emg signal
        emg_data = numpy.array([list(msg.data)])
        # Update array by populating it with predicted class
        predicted_class = sess.run(y_pred_cls, feed_dict={x: emg_data})
        array[counter] = predicted_class
        # Increase counter and run gesture classification
        counter = counter+1
        # Check for gesture classification after 150 checkpoints
        if counter > 149:
            # Repeat counter, then find the most frequent result in the array
            counter = 0
            (values,counts) = np.unique(array,return_counts=True)
            ind = np.argmax(counts)
            result = int(values[ind])
            # Print gesture classification result
            if result == 0 and predicted_class_last != 0:
                print("Rest")
            elif result == 1 and predicted_class_last != 1:
                print("Fist")
            elif result == 2 and predicted_class_last != 2:
                print("Finger Spread")
            elif result == 3 and predicted_class_last != 3:
                print("OK")
            elif result == 4 and predicted_class_last != 4:
                print("Pinch")
            elif result == 5 and predicted_class_last != 5:
                print("Peace")
            # Assign old predicted class so it doesnt repeat
            predicted_class_last = result

    # Subscribe to ros_myo to stream EMG signal and push it to the callback
    rospy.Subscriber("/myo_raw/myo_emg", EmgArray, get_emg_array)

    rospy.spin()
    sess.close()

if __name__ == '__main__':
    main()

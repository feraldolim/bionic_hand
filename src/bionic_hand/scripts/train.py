#!/usr/bin/env python

import numpy as np
import tensorflow as tf
from time import time
from datetime import datetime
import scipy.io as scipy
from oct2py import octave
import rospy
import math
import numpy
from numpy import genfromtxt

def main():
    global PCA_dir, gesture_size,range_E
    # Initialize rosnode
    rospy.init_node('ANN_training',anonymous=True)
    # Get filter flag to determine which data to take and where to save the checkpoints
    filter_flag = rospy.get_param('~filter_flag')
    # Save directory path
    if filter_flag == 1:
        _SAVE_PATH = "/home/feraldo/ROS_ws/bionic_hand_ws/data/filtered/tensorflow/"
        _DATA_PATH = "/home/feraldo/ROS_ws/bionic_hand_ws/data/filtered/rawDataCombined.mat"
        gest_size_dir = "/home/feraldo/ROS_ws/bionic_hand_ws/data/filtered/gesture_size.csv"
    elif filter_flag == 0:
        _SAVE_PATH = "/home/feraldo/ROS_ws/bionic_hand_ws/data/unfiltered/tensorflow/"
        _DATA_PATH = "/home/feraldo/ROS_ws/bionic_hand_ws/data/unfiltered/rawDataCombined.mat"
        gest_size_dir = "/home/feraldo/ROS_ws/bionic_hand_ws/data/unfiltered/gesture_size.csv"

    def model(_NUM_CLASSES):
        # Placeholder for input data x and y
        with tf.name_scope('data'):
            # Size of x: 1x8 (vector)
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

    def get_data_set():
        # Initiate x and y to store the gesture data samples
        x = None
        y = None
        # Call an octave function to combine the separate EMG data samples
        octave.addpath('/home/feraldo/ROS_ws/bionic_hand_ws/data/')
        octave.combineData(filter_flag)
        # Store the array into x and y
        mat = scipy.loadmat(_DATA_PATH)
        x = mat['gesture_combined']
        y = mat['output_combined']
        return x, y

    # Batch calculations per data samples
    _BATCH_SIZE = 300
    # Output gestures classes
    _CLASS_SIZE = int(genfromtxt(gest_size_dir)) + 1
    # Import data samples here
    train_x, train_y = get_data_set()
    # Generate NN model
    x, y, output, global_step, y_pred_cls = model(_CLASS_SIZE)

    # Square error loss calculation
    loss = tf.reduce_mean(tf.nn.softmax_cross_entropy_with_logits(logits=output, labels=y))
    tf.summary.scalar("Loss", loss)
    # Use RMSProp as optimizer setting
    optimizer = tf.train.RMSPropOptimizer(learning_rate=1e-4).minimize(loss, global_step=global_step)

    # Compare NN model results to output setpoint
    correct_prediction = tf.equal(y_pred_cls, tf.argmax(y, dimension=1))
    # Calculate the accuracy of the model
    accuracy = tf.reduce_mean(tf.cast(correct_prediction, tf.float32))
    tf.summary.scalar("Accuracy/train", accuracy)

    # Initiate weights and bias with random numbers
    init = tf.global_variables_initializer()
    # Handler to save checkpoint summary to savepath directory
    merged = tf.summary.merge_all()
    saver = tf.train.Saver()
    # Handler to start training session
    sess = tf.Session()
    # File writer to save session checkpoints
    train_writer = tf.summary.FileWriter(_SAVE_PATH, sess.graph)

    try:
        # Load last checkpoint to continue training from previous session.
        print("Trying to restore last checkpoint ...")
        last_chk_path = tf.train.latest_checkpoint(checkpoint_dir=_SAVE_PATH)
        saver.restore(sess, save_path=last_chk_path)
    except:
        # Start new session
        print("Failed to restore checkpoint. Initializing variables instead.")
        sess.run(tf.global_variables_initializer())

    def train(num_iterations):
        # Train for the preset iterations, record each 10 global steps and 100 global steps
        for i in range(num_iterations):
            # Perform batch calculations randomly. This is to increase accuracy and faster performance
            randidx = np.random.randint(len(train_x), size=_BATCH_SIZE)
            batch_xs = train_x[randidx]
            batch_ys = train_y[randidx]

            # Record start time
            start_time = time()
            # Run forward computations, and returns the increased global step.
            i_global, _ = sess.run([global_step, optimizer], feed_dict={x: batch_xs, y: batch_ys})
            # Save the time duration
            duration = time() - start_time

            # Each 10 steps, calculate loss and accuracy of the batch calculation.
            if (i_global % 10 == 0) or (i == num_iterations - 1):
                _loss, batch_acc = sess.run([loss, accuracy], feed_dict={x: batch_xs, y: batch_ys})
                msg = "Global Step: {0:>6}, accuracy: {1:>6.1%}, loss = {2:.2f} ({3:.1f} examples/sec, {4:.2f} sec/batch)"
                print(msg.format(i_global, batch_acc, _loss, _BATCH_SIZE / duration, duration))
            # Each 100 steps, save checkpoint to savepath directory.
            if (i_global % 100 == 0) or (i == num_iterations - 1):
                data_merged, global_1 = sess.run([merged, global_step], feed_dict={x: batch_xs, y: batch_ys})
                train_writer.add_summary(data_merged, global_1)
                saver.save(sess, save_path=_SAVE_PATH, global_step=global_step)
                print("Saved checkpoint.")

    # Get epoch from passed parameters
    epoch = rospy.get_param('~epoch')
    # Start counting the elapsed time and the training
    training_time = time()
    train(epoch)
    # Finish training and calculate elapsed time
    training_duration = time() - training_time
    duration_msg = "Training duration: {}"
    print(duration_msg.format(training_duration))
    # Finish session.
    sess.close()
    # Exit rosnode after process is done cleanly
    print 'Done.'
    rospy.signal_shutdown('done.')

    rospy.spin()

if __name__ == '__main__':
    main()

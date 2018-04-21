#include <vector>
#include <string>
#include "ros/ros.h"
#include <boost/array.hpp>
#include "bionic_hand/EmgArray.h"
#include "bionic_hand/MyoArm.h"
#include "bionic_hand/MyoPose.h"
#include "bionic_hand/FingerPosition.h"
#include "sensor_msgs/JointState.h"
#include "std_msgs/Int32.h"

// DEFINE USED PACKAGE MESSAGES
using bionic_hand::EmgArray;
using bionic_hand::MyoArm;
using bionic_hand::MyoPose;
using bionic_hand::FingerPosition;
using sensor_msgs::JointState;
using std_msgs::Int32;
using std::string;

// SET PUBLISHER TO GLOBAL VARIABLE, ARRANGE CLASS HERE LATER TO AVOID GLOBALS
ros::Publisher finger_position_pub;
ros::Publisher pose_arduino;

// CURRENT POSITION AND PRESET FINGER ANGLES
std::vector<double> cur_pos;
std::vector<double> finger_angle(20);

// MAIN CONTROLLER HERE, READ EMG FROM MYO
void EMG_callback(const bionic_hand::EmgArray::ConstPtr& msg) {
    typedef boost::array<short int, 8ul> array;
    array x = msg->data;
    ROS_INFO("EMG: %d %d %d %d %d %d %d %d", x[0], x[1], x[2], x[3], x[4], x[5], x[6], x[7]);
    // CONTINUE GESTURE RECOGNITION HERE
}

// CONTROL SIMULATION USING PRESET GESTURES (HARDCODED)
void gesture_callback(const bionic_hand::MyoPose::ConstPtr& msg) {
    // PRESET POSE INDEX, FOUND FROM MYO PACKAGE
    int y = msg->pose;

    // SIMULATIONS PARAMETERS, TO MOVE FINGERS TO THE SETPOINTS
    if (y == 1) {
        ROS_INFO("Gesture: REST");
        finger_angle[0] = 0.0;
        finger_angle[1] = 0.0;
        finger_angle[2] = 0.0;
        finger_angle[3] = 0.0;
        finger_angle[4] = 0.0;
        finger_angle[5] = 0.0;
        finger_angle[6] = 0.0;
        finger_angle[7] = 0.0;
        finger_angle[8] = 0.0;
        finger_angle[9] = 0.0;
        finger_angle[10] = 0.0;
        finger_angle[11] = 0.0;
        finger_angle[12] = 0.0;
        finger_angle[13] = 0.0;
        finger_angle[14] = 0.0;
        finger_angle[15] = 0.0;
        finger_angle[16] = 0.0;
        finger_angle[17] = 0.0;
        finger_angle[18] = 0.0;
        finger_angle[19] = 0.0;
    }
    else if (y == 2) {
        ROS_INFO("Gesture: FIST");
        //    Fist gesture hardcode
        finger_angle[0] = 0.38;
        finger_angle[1] = 0.0;
        finger_angle[2] = 0.0;
        finger_angle[3] = 0.39;
        finger_angle[4] = 0.56;
        finger_angle[5] = 1.33;
        finger_angle[6] = 0.80;
        finger_angle[7] = 1.39;
        finger_angle[8] = 0.80;
        finger_angle[9] = 1.33;
        finger_angle[10] = 1.39;
        finger_angle[11] = 0.98;
        finger_angle[12] = 1.33;
        finger_angle[13] = 1.39;
        finger_angle[14] = 0.98;
        finger_angle[15] = 1.33;
        finger_angle[16] = 1.40;
        finger_angle[17] = 0.09;
        finger_angle[18] = 0.09;
        finger_angle[19] = 0.17;
    }
    else if (y == 3) {
        ROS_INFO("Gesture: WAVE_IN");
    }
    else if (y == 4) {
        ROS_INFO("Gesture: WAVE_OUT");
    }
    else if (y == 5) {
        ROS_INFO("Gesture: FINGERS_SPREAD");
        //    Finger spread gesture hardcode
        finger_angle[0] = 0.0;
        finger_angle[1] = 0.0;
        finger_angle[2] = 0.0;
        finger_angle[3] = 0.0;
        finger_angle[4] = 0.0;
        finger_angle[5] = 0.0;
        finger_angle[6] = 0.0;
        finger_angle[7] = 0.0;
        finger_angle[8] = 0.0;
        finger_angle[9] = 0.0;
        finger_angle[10] = 0.0;
        finger_angle[11] = 0.0;
        finger_angle[12] = 0.0;
        finger_angle[13] = 0.0;
        finger_angle[14] = 0.0;
        finger_angle[15] = 0.0;
        finger_angle[16] = 0.0;
        finger_angle[17] = 0.29;
        finger_angle[18] = 0.29;
        finger_angle[19] = 0.58;
    }
    else if (y == 6) {
        ROS_INFO("Gesture: THUMB_TO_PINKY");
    }
    else if (y == 0) {
        ROS_INFO("Gesture: UNKNOWN");
    }

    // PUBLISH POSE GESTURE
    Int32 pose;
    pose.data = y;
    pose_arduino.publish(pose);

}

// GET JOINT NAMES HERE, ALWAYS PUBLISH TO CONTROL THE JOINTS
void joint_callback(const sensor_msgs::JointState::ConstPtr& msg) {
    // DEFINE NAME FROM MESSAGE FOR SIMULATION
    const std::vector<string> name = msg->name;

    // DEFINE ARRAY OF DIFFERENCES AND POSITIONS FOR CONTROLLER
    std::vector<double> diff(20);
    std::vector<double> pos(20);

    // JointState MESSAGE HANDLE
    JointState result;

    // GET CURRENT POSITION FROM JOINT STATE
    cur_pos = msg->position;

    // P CONTROLLER
    for (int i = 0; i<20; i++){
        diff[i] = finger_angle[i] - cur_pos[i];
        //ROS_INFO("diff = %f",diff[i]);
        pos[i] = cur_pos[i];

        if (diff[i] > 0.001) {
            pos[i] += 0.01;
        }

        if (diff[i] < -0.001) {
            pos[i] -= 0.01;
        }
    }

    // PUBLISH TO HAND SIMULATION
    result.position = pos;
    result.name = name;
    finger_position_pub.publish(result);

//    // SHOW CURRENT POSITION OF THE FINGERS
//    ROS_INFO("\nleft_hand_Thumb_Flexion: %f "
//             "\nleft_hand_Thumb_Opposition: %f"
//             "\nleft_hand_j5: %f "
//             "\nleft_hand_j3: %f"
//             "\nleft_hand_j4: %f"
//             "\nleft_hand_Index_Finger_Distal: %f"
//             "\nleft_hand_Index_Finger_Proximal: %f"
//             "\nleft_hand_j14: %f"
//             "\nleft_hand_Middle_Finger_Proximal: %f"
//             "\nleft_hand_Middle_Finger_Distal: %f"
//             "\nleft_hand_j15: %f"
//             "\nleft_hand_Ring_Finger :%f"
//             "\nleft_hand_j12: %f"
//             "\nleft_hand_j16: %f"
//             "\nleft_hand_Pinky: %f"
//             "\nleft_hand_j13: %f"
//             "\nleft_hand_j17: %f"
//             "\nleft_hand_index_spread: %f"
//             "\nleft_hand_ring_spread: %f"
//             "\nleft_hand_Finger_Spread: %f",cur_pos[0], cur_pos[1], cur_pos[2], cur_pos[3], cur_pos[4], cur_pos[5],
//            cur_pos[6], cur_pos[7], cur_pos[8], cur_pos[9], cur_pos[10], cur_pos[11], cur_pos[12], cur_pos[13], cur_pos[14], cur_pos[15],
//            cur_pos[16], cur_pos[17], cur_pos[18], cur_pos[19]);
}

// MAIN FUNCTION HERE
int main(int argc, char** argv) {
    // INITIATE ROS AND DEFINE HANDLER
    ros::init(argc, argv, "bionic_hand_controller");
    ros::NodeHandle nh;
    // SUBSCRIBE HANDLERS TO EMG AND GESTURE TOPICS FROM MYO. AND JOINTSTATES FROM SIMULATIONS
    ros::Subscriber sub1 = nh.subscribe("/myo_raw/myo_emg", 10, EMG_callback);
    ros::Subscriber sub2 = nh.subscribe("/myo_raw/myo_gest", 10, gesture_callback);
    ros::Subscriber sub3 = nh.subscribe("/joint_states", 10, joint_callback);

    // PUBLISH HANDLERS TO SIMULATIONS AND ARDUINO
    finger_position_pub = nh.advertise<JointState>("/svh_controller/channel_targets",10);
    pose_arduino = nh.advertise<Int32>("/pose_arduino",10);

    ros::spin();
    return 0;
}

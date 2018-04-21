cmake_minimum_required(VERSION 2.8.3)
project(bionic_hand)


find_package(catkin REQUIRED COMPONENTS
  message_generation
  roscpp
  rospy
  nav_msgs
  sensor_msgs
)

## System dependencies are found with CMake's conventions
#find_package(Boost REQUIRED COMPONENTS system)

 add_message_files(
   FILES
   FingerPosition.msg
   EmgArray.msg
   MyoArm.msg
   MyoPose.msg

 )

## Generate added messages and services with any dependencies listed here
 generate_messages(
   DEPENDENCIES
   nav_msgs
   sensor_msgs
#   actionlib_msgs
 )

catkin_package(
  CATKIN_DEPENDS message_runtime roscpp rospy nav_msgs sensor_msgs
)


include_directories(
  include
  ${catkin_INCLUDE_DIRS}
  ${Boost_INCLUDE_DIRS}
)


add_executable(emg_control_node src/emg_data.cpp)


add_dependencies(emg_control_node emg_control_generate_messages_cpp)


target_link_libraries(emg_control_node ${catkin_LIBRARIES})




## Generate services in the 'srv' folder
# add_service_files(
#   FILES
#   demo_srv.srv
# )

## Generate actions in the 'action' folder
# add_action_files(
#   FILES
#   Demo_action.action
# )

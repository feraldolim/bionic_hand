# Install script for directory: /home/feraldo/ROS_ws/bionic_hand_ws/src/ros_myo

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/feraldo/ROS_ws/bionic_hand_ws/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ros_myo/msg" TYPE FILE FILES
    "/home/feraldo/ROS_ws/bionic_hand_ws/src/ros_myo/msg/MyoArm.msg"
    "/home/feraldo/ROS_ws/bionic_hand_ws/src/ros_myo/msg/EmgArray.msg"
    "/home/feraldo/ROS_ws/bionic_hand_ws/src/ros_myo/msg/MyoPose.msg"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ros_myo/cmake" TYPE FILE FILES "/home/feraldo/ROS_ws/bionic_hand_ws/build/ros_myo/catkin_generated/installspace/ros_myo-msg-paths.cmake")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/feraldo/ROS_ws/bionic_hand_ws/devel/include/ros_myo")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/home/feraldo/ROS_ws/bionic_hand_ws/devel/share/roseus/ros/ros_myo")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/home/feraldo/ROS_ws/bionic_hand_ws/devel/share/common-lisp/ros/ros_myo")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/home/feraldo/ROS_ws/bionic_hand_ws/devel/share/gennodejs/ros/ros_myo")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  execute_process(COMMAND "/usr/bin/python" -m compileall "/home/feraldo/ROS_ws/bionic_hand_ws/devel/lib/python2.7/dist-packages/ros_myo")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python2.7/dist-packages" TYPE DIRECTORY FILES "/home/feraldo/ROS_ws/bionic_hand_ws/devel/lib/python2.7/dist-packages/ros_myo")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/feraldo/ROS_ws/bionic_hand_ws/build/ros_myo/catkin_generated/installspace/ros_myo.pc")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ros_myo/cmake" TYPE FILE FILES "/home/feraldo/ROS_ws/bionic_hand_ws/build/ros_myo/catkin_generated/installspace/ros_myo-msg-extras.cmake")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ros_myo/cmake" TYPE FILE FILES
    "/home/feraldo/ROS_ws/bionic_hand_ws/build/ros_myo/catkin_generated/installspace/ros_myoConfig.cmake"
    "/home/feraldo/ROS_ws/bionic_hand_ws/build/ros_myo/catkin_generated/installspace/ros_myoConfig-version.cmake"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ros_myo" TYPE FILE FILES "/home/feraldo/ROS_ws/bionic_hand_ws/src/ros_myo/package.xml")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/ros_myo" TYPE PROGRAM FILES
    "/home/feraldo/ROS_ws/bionic_hand_ws/src/ros_myo/scripts/myo-rawNode.py"
    "/home/feraldo/ROS_ws/bionic_hand_ws/src/ros_myo/scripts/bluetooth.py"
    "/home/feraldo/ROS_ws/bionic_hand_ws/src/ros_myo/scripts/common.py"
    "/home/feraldo/ROS_ws/bionic_hand_ws/src/ros_myo/scripts/emg_ascii_graph.py"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ros_myo/launch" TYPE DIRECTORY FILES "/home/feraldo/ROS_ws/bionic_hand_ws/src/ros_myo/launch/")
endif()


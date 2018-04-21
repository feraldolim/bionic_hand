# Install script for directory: /home/feraldo/ROS_ws/bionic_hand_ws/src/bionic_hand

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/bionic_hand/msg" TYPE FILE FILES
    "/home/feraldo/ROS_ws/bionic_hand_ws/src/bionic_hand/msg/FingerPosition.msg"
    "/home/feraldo/ROS_ws/bionic_hand_ws/src/bionic_hand/msg/EmgArray.msg"
    "/home/feraldo/ROS_ws/bionic_hand_ws/src/bionic_hand/msg/MyoArm.msg"
    "/home/feraldo/ROS_ws/bionic_hand_ws/src/bionic_hand/msg/MyoPose.msg"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/bionic_hand/cmake" TYPE FILE FILES "/home/feraldo/ROS_ws/bionic_hand_ws/build/bionic_hand/catkin_generated/installspace/bionic_hand-msg-paths.cmake")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/feraldo/ROS_ws/bionic_hand_ws/devel/include/bionic_hand")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/home/feraldo/ROS_ws/bionic_hand_ws/devel/share/roseus/ros/bionic_hand")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/home/feraldo/ROS_ws/bionic_hand_ws/devel/share/common-lisp/ros/bionic_hand")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/home/feraldo/ROS_ws/bionic_hand_ws/devel/share/gennodejs/ros/bionic_hand")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  execute_process(COMMAND "/usr/bin/python" -m compileall "/home/feraldo/ROS_ws/bionic_hand_ws/devel/lib/python2.7/dist-packages/bionic_hand")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python2.7/dist-packages" TYPE DIRECTORY FILES "/home/feraldo/ROS_ws/bionic_hand_ws/devel/lib/python2.7/dist-packages/bionic_hand")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/feraldo/ROS_ws/bionic_hand_ws/build/bionic_hand/catkin_generated/installspace/bionic_hand.pc")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/bionic_hand/cmake" TYPE FILE FILES "/home/feraldo/ROS_ws/bionic_hand_ws/build/bionic_hand/catkin_generated/installspace/bionic_hand-msg-extras.cmake")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/bionic_hand/cmake" TYPE FILE FILES
    "/home/feraldo/ROS_ws/bionic_hand_ws/build/bionic_hand/catkin_generated/installspace/bionic_handConfig.cmake"
    "/home/feraldo/ROS_ws/bionic_hand_ws/build/bionic_hand/catkin_generated/installspace/bionic_handConfig-version.cmake"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/bionic_hand" TYPE FILE FILES "/home/feraldo/ROS_ws/bionic_hand_ws/src/bionic_hand/package.xml")
endif()


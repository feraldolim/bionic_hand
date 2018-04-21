# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "bionic_hand: 4 messages, 0 services")

set(MSG_I_FLAGS "-Ibionic_hand:/home/feraldo/ROS_ws/bionic_hand_ws/src/bionic_hand/msg;-Inav_msgs:/opt/ros/kinetic/share/nav_msgs/cmake/../msg;-Isensor_msgs:/opt/ros/kinetic/share/sensor_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/kinetic/share/geometry_msgs/cmake/../msg;-Istd_msgs:/opt/ros/kinetic/share/std_msgs/cmake/../msg;-Iactionlib_msgs:/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(bionic_hand_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/feraldo/ROS_ws/bionic_hand_ws/src/bionic_hand/msg/MyoArm.msg" NAME_WE)
add_custom_target(_bionic_hand_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "bionic_hand" "/home/feraldo/ROS_ws/bionic_hand_ws/src/bionic_hand/msg/MyoArm.msg" ""
)

get_filename_component(_filename "/home/feraldo/ROS_ws/bionic_hand_ws/src/bionic_hand/msg/FingerPosition.msg" NAME_WE)
add_custom_target(_bionic_hand_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "bionic_hand" "/home/feraldo/ROS_ws/bionic_hand_ws/src/bionic_hand/msg/FingerPosition.msg" ""
)

get_filename_component(_filename "/home/feraldo/ROS_ws/bionic_hand_ws/src/bionic_hand/msg/EmgArray.msg" NAME_WE)
add_custom_target(_bionic_hand_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "bionic_hand" "/home/feraldo/ROS_ws/bionic_hand_ws/src/bionic_hand/msg/EmgArray.msg" ""
)

get_filename_component(_filename "/home/feraldo/ROS_ws/bionic_hand_ws/src/bionic_hand/msg/MyoPose.msg" NAME_WE)
add_custom_target(_bionic_hand_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "bionic_hand" "/home/feraldo/ROS_ws/bionic_hand_ws/src/bionic_hand/msg/MyoPose.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(bionic_hand
  "/home/feraldo/ROS_ws/bionic_hand_ws/src/bionic_hand/msg/MyoArm.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/bionic_hand
)
_generate_msg_cpp(bionic_hand
  "/home/feraldo/ROS_ws/bionic_hand_ws/src/bionic_hand/msg/EmgArray.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/bionic_hand
)
_generate_msg_cpp(bionic_hand
  "/home/feraldo/ROS_ws/bionic_hand_ws/src/bionic_hand/msg/FingerPosition.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/bionic_hand
)
_generate_msg_cpp(bionic_hand
  "/home/feraldo/ROS_ws/bionic_hand_ws/src/bionic_hand/msg/MyoPose.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/bionic_hand
)

### Generating Services

### Generating Module File
_generate_module_cpp(bionic_hand
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/bionic_hand
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(bionic_hand_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(bionic_hand_generate_messages bionic_hand_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/feraldo/ROS_ws/bionic_hand_ws/src/bionic_hand/msg/MyoArm.msg" NAME_WE)
add_dependencies(bionic_hand_generate_messages_cpp _bionic_hand_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/feraldo/ROS_ws/bionic_hand_ws/src/bionic_hand/msg/FingerPosition.msg" NAME_WE)
add_dependencies(bionic_hand_generate_messages_cpp _bionic_hand_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/feraldo/ROS_ws/bionic_hand_ws/src/bionic_hand/msg/EmgArray.msg" NAME_WE)
add_dependencies(bionic_hand_generate_messages_cpp _bionic_hand_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/feraldo/ROS_ws/bionic_hand_ws/src/bionic_hand/msg/MyoPose.msg" NAME_WE)
add_dependencies(bionic_hand_generate_messages_cpp _bionic_hand_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(bionic_hand_gencpp)
add_dependencies(bionic_hand_gencpp bionic_hand_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS bionic_hand_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(bionic_hand
  "/home/feraldo/ROS_ws/bionic_hand_ws/src/bionic_hand/msg/MyoArm.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/bionic_hand
)
_generate_msg_eus(bionic_hand
  "/home/feraldo/ROS_ws/bionic_hand_ws/src/bionic_hand/msg/EmgArray.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/bionic_hand
)
_generate_msg_eus(bionic_hand
  "/home/feraldo/ROS_ws/bionic_hand_ws/src/bionic_hand/msg/FingerPosition.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/bionic_hand
)
_generate_msg_eus(bionic_hand
  "/home/feraldo/ROS_ws/bionic_hand_ws/src/bionic_hand/msg/MyoPose.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/bionic_hand
)

### Generating Services

### Generating Module File
_generate_module_eus(bionic_hand
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/bionic_hand
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(bionic_hand_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(bionic_hand_generate_messages bionic_hand_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/feraldo/ROS_ws/bionic_hand_ws/src/bionic_hand/msg/MyoArm.msg" NAME_WE)
add_dependencies(bionic_hand_generate_messages_eus _bionic_hand_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/feraldo/ROS_ws/bionic_hand_ws/src/bionic_hand/msg/FingerPosition.msg" NAME_WE)
add_dependencies(bionic_hand_generate_messages_eus _bionic_hand_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/feraldo/ROS_ws/bionic_hand_ws/src/bionic_hand/msg/EmgArray.msg" NAME_WE)
add_dependencies(bionic_hand_generate_messages_eus _bionic_hand_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/feraldo/ROS_ws/bionic_hand_ws/src/bionic_hand/msg/MyoPose.msg" NAME_WE)
add_dependencies(bionic_hand_generate_messages_eus _bionic_hand_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(bionic_hand_geneus)
add_dependencies(bionic_hand_geneus bionic_hand_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS bionic_hand_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(bionic_hand
  "/home/feraldo/ROS_ws/bionic_hand_ws/src/bionic_hand/msg/MyoArm.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/bionic_hand
)
_generate_msg_lisp(bionic_hand
  "/home/feraldo/ROS_ws/bionic_hand_ws/src/bionic_hand/msg/EmgArray.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/bionic_hand
)
_generate_msg_lisp(bionic_hand
  "/home/feraldo/ROS_ws/bionic_hand_ws/src/bionic_hand/msg/FingerPosition.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/bionic_hand
)
_generate_msg_lisp(bionic_hand
  "/home/feraldo/ROS_ws/bionic_hand_ws/src/bionic_hand/msg/MyoPose.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/bionic_hand
)

### Generating Services

### Generating Module File
_generate_module_lisp(bionic_hand
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/bionic_hand
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(bionic_hand_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(bionic_hand_generate_messages bionic_hand_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/feraldo/ROS_ws/bionic_hand_ws/src/bionic_hand/msg/MyoArm.msg" NAME_WE)
add_dependencies(bionic_hand_generate_messages_lisp _bionic_hand_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/feraldo/ROS_ws/bionic_hand_ws/src/bionic_hand/msg/FingerPosition.msg" NAME_WE)
add_dependencies(bionic_hand_generate_messages_lisp _bionic_hand_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/feraldo/ROS_ws/bionic_hand_ws/src/bionic_hand/msg/EmgArray.msg" NAME_WE)
add_dependencies(bionic_hand_generate_messages_lisp _bionic_hand_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/feraldo/ROS_ws/bionic_hand_ws/src/bionic_hand/msg/MyoPose.msg" NAME_WE)
add_dependencies(bionic_hand_generate_messages_lisp _bionic_hand_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(bionic_hand_genlisp)
add_dependencies(bionic_hand_genlisp bionic_hand_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS bionic_hand_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(bionic_hand
  "/home/feraldo/ROS_ws/bionic_hand_ws/src/bionic_hand/msg/MyoArm.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/bionic_hand
)
_generate_msg_nodejs(bionic_hand
  "/home/feraldo/ROS_ws/bionic_hand_ws/src/bionic_hand/msg/EmgArray.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/bionic_hand
)
_generate_msg_nodejs(bionic_hand
  "/home/feraldo/ROS_ws/bionic_hand_ws/src/bionic_hand/msg/FingerPosition.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/bionic_hand
)
_generate_msg_nodejs(bionic_hand
  "/home/feraldo/ROS_ws/bionic_hand_ws/src/bionic_hand/msg/MyoPose.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/bionic_hand
)

### Generating Services

### Generating Module File
_generate_module_nodejs(bionic_hand
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/bionic_hand
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(bionic_hand_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(bionic_hand_generate_messages bionic_hand_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/feraldo/ROS_ws/bionic_hand_ws/src/bionic_hand/msg/MyoArm.msg" NAME_WE)
add_dependencies(bionic_hand_generate_messages_nodejs _bionic_hand_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/feraldo/ROS_ws/bionic_hand_ws/src/bionic_hand/msg/FingerPosition.msg" NAME_WE)
add_dependencies(bionic_hand_generate_messages_nodejs _bionic_hand_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/feraldo/ROS_ws/bionic_hand_ws/src/bionic_hand/msg/EmgArray.msg" NAME_WE)
add_dependencies(bionic_hand_generate_messages_nodejs _bionic_hand_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/feraldo/ROS_ws/bionic_hand_ws/src/bionic_hand/msg/MyoPose.msg" NAME_WE)
add_dependencies(bionic_hand_generate_messages_nodejs _bionic_hand_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(bionic_hand_gennodejs)
add_dependencies(bionic_hand_gennodejs bionic_hand_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS bionic_hand_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(bionic_hand
  "/home/feraldo/ROS_ws/bionic_hand_ws/src/bionic_hand/msg/MyoArm.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/bionic_hand
)
_generate_msg_py(bionic_hand
  "/home/feraldo/ROS_ws/bionic_hand_ws/src/bionic_hand/msg/EmgArray.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/bionic_hand
)
_generate_msg_py(bionic_hand
  "/home/feraldo/ROS_ws/bionic_hand_ws/src/bionic_hand/msg/FingerPosition.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/bionic_hand
)
_generate_msg_py(bionic_hand
  "/home/feraldo/ROS_ws/bionic_hand_ws/src/bionic_hand/msg/MyoPose.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/bionic_hand
)

### Generating Services

### Generating Module File
_generate_module_py(bionic_hand
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/bionic_hand
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(bionic_hand_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(bionic_hand_generate_messages bionic_hand_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/feraldo/ROS_ws/bionic_hand_ws/src/bionic_hand/msg/MyoArm.msg" NAME_WE)
add_dependencies(bionic_hand_generate_messages_py _bionic_hand_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/feraldo/ROS_ws/bionic_hand_ws/src/bionic_hand/msg/FingerPosition.msg" NAME_WE)
add_dependencies(bionic_hand_generate_messages_py _bionic_hand_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/feraldo/ROS_ws/bionic_hand_ws/src/bionic_hand/msg/EmgArray.msg" NAME_WE)
add_dependencies(bionic_hand_generate_messages_py _bionic_hand_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/feraldo/ROS_ws/bionic_hand_ws/src/bionic_hand/msg/MyoPose.msg" NAME_WE)
add_dependencies(bionic_hand_generate_messages_py _bionic_hand_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(bionic_hand_genpy)
add_dependencies(bionic_hand_genpy bionic_hand_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS bionic_hand_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/bionic_hand)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/bionic_hand
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET nav_msgs_generate_messages_cpp)
  add_dependencies(bionic_hand_generate_messages_cpp nav_msgs_generate_messages_cpp)
endif()
if(TARGET sensor_msgs_generate_messages_cpp)
  add_dependencies(bionic_hand_generate_messages_cpp sensor_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/bionic_hand)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/bionic_hand
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET nav_msgs_generate_messages_eus)
  add_dependencies(bionic_hand_generate_messages_eus nav_msgs_generate_messages_eus)
endif()
if(TARGET sensor_msgs_generate_messages_eus)
  add_dependencies(bionic_hand_generate_messages_eus sensor_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/bionic_hand)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/bionic_hand
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET nav_msgs_generate_messages_lisp)
  add_dependencies(bionic_hand_generate_messages_lisp nav_msgs_generate_messages_lisp)
endif()
if(TARGET sensor_msgs_generate_messages_lisp)
  add_dependencies(bionic_hand_generate_messages_lisp sensor_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/bionic_hand)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/bionic_hand
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET nav_msgs_generate_messages_nodejs)
  add_dependencies(bionic_hand_generate_messages_nodejs nav_msgs_generate_messages_nodejs)
endif()
if(TARGET sensor_msgs_generate_messages_nodejs)
  add_dependencies(bionic_hand_generate_messages_nodejs sensor_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/bionic_hand)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/bionic_hand\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/bionic_hand
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET nav_msgs_generate_messages_py)
  add_dependencies(bionic_hand_generate_messages_py nav_msgs_generate_messages_py)
endif()
if(TARGET sensor_msgs_generate_messages_py)
  add_dependencies(bionic_hand_generate_messages_py sensor_msgs_generate_messages_py)
endif()

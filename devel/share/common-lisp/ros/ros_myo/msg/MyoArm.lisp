; Auto-generated. Do not edit!


(cl:in-package ros_myo-msg)


;//! \htmlinclude MyoArm.msg.html

(cl:defclass <MyoArm> (roslisp-msg-protocol:ros-message)
  ((arm
    :reader arm
    :initarg :arm
    :type cl:fixnum
    :initform 0)
   (xdir
    :reader xdir
    :initarg :xdir
    :type cl:fixnum
    :initform 0))
)

(cl:defclass MyoArm (<MyoArm>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MyoArm>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MyoArm)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ros_myo-msg:<MyoArm> is deprecated: use ros_myo-msg:MyoArm instead.")))

(cl:ensure-generic-function 'arm-val :lambda-list '(m))
(cl:defmethod arm-val ((m <MyoArm>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_myo-msg:arm-val is deprecated.  Use ros_myo-msg:arm instead.")
  (arm m))

(cl:ensure-generic-function 'xdir-val :lambda-list '(m))
(cl:defmethod xdir-val ((m <MyoArm>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_myo-msg:xdir-val is deprecated.  Use ros_myo-msg:xdir instead.")
  (xdir m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<MyoArm>)))
    "Constants for message type '<MyoArm>"
  '((:UNKNOWN . 0)
    (:RIGHT . 1)
    (:LEFT . 2)
    (:X_TOWARD_WRIST . 11)
    (:X_TOWARD_ELBOW . 12))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'MyoArm)))
    "Constants for message type 'MyoArm"
  '((:UNKNOWN . 0)
    (:RIGHT . 1)
    (:LEFT . 2)
    (:X_TOWARD_WRIST . 11)
    (:X_TOWARD_ELBOW . 12))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MyoArm>) ostream)
  "Serializes a message object of type '<MyoArm>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'arm)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'xdir)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MyoArm>) istream)
  "Deserializes a message object of type '<MyoArm>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'arm)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'xdir)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MyoArm>)))
  "Returns string type for a message object of type '<MyoArm>"
  "ros_myo/MyoArm")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MyoArm)))
  "Returns string type for a message object of type 'MyoArm"
  "ros_myo/MyoArm")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MyoArm>)))
  "Returns md5sum for a message object of type '<MyoArm>"
  "18b76488390e8ae3f8451095f1b48ad8")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MyoArm)))
  "Returns md5sum for a message object of type 'MyoArm"
  "18b76488390e8ae3f8451095f1b48ad8")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MyoArm>)))
  "Returns full string definition for message of type '<MyoArm>"
  (cl:format cl:nil "# Arm message for the Thalmic Myo. Using firmware > 1.0, ~%# Thalmic Gesture Recognition is possible after sync gesture is performed.~%~%# arm represents which arm the device is on~%uint8 UNKNOWN=0~%uint8 RIGHT=1~%uint8 LEFT=2~%uint8 arm~%~%# xdir represents the direction of the x-axis~%# Sharing UNKNOWN=0~%uint8 X_TOWARD_WRIST=11~%uint8 X_TOWARD_ELBOW=12~%uint8 xdir~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MyoArm)))
  "Returns full string definition for message of type 'MyoArm"
  (cl:format cl:nil "# Arm message for the Thalmic Myo. Using firmware > 1.0, ~%# Thalmic Gesture Recognition is possible after sync gesture is performed.~%~%# arm represents which arm the device is on~%uint8 UNKNOWN=0~%uint8 RIGHT=1~%uint8 LEFT=2~%uint8 arm~%~%# xdir represents the direction of the x-axis~%# Sharing UNKNOWN=0~%uint8 X_TOWARD_WRIST=11~%uint8 X_TOWARD_ELBOW=12~%uint8 xdir~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MyoArm>))
  (cl:+ 0
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MyoArm>))
  "Converts a ROS message object to a list"
  (cl:list 'MyoArm
    (cl:cons ':arm (arm msg))
    (cl:cons ':xdir (xdir msg))
))

; Auto-generated. Do not edit!


(cl:in-package bionic_hand-msg)


;//! \htmlinclude MyoPose.msg.html

(cl:defclass <MyoPose> (roslisp-msg-protocol:ros-message)
  ((pose
    :reader pose
    :initarg :pose
    :type cl:fixnum
    :initform 0))
)

(cl:defclass MyoPose (<MyoPose>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MyoPose>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MyoPose)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name bionic_hand-msg:<MyoPose> is deprecated: use bionic_hand-msg:MyoPose instead.")))

(cl:ensure-generic-function 'pose-val :lambda-list '(m))
(cl:defmethod pose-val ((m <MyoPose>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader bionic_hand-msg:pose-val is deprecated.  Use bionic_hand-msg:pose instead.")
  (pose m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<MyoPose>)))
    "Constants for message type '<MyoPose>"
  '((:REST . 1)
    (:FIST . 2)
    (:WAVE_IN . 3)
    (:WAVE_OUT . 4)
    (:FINGERS_SPREAD . 5)
    (:THUMB_TO_PINKY . 6)
    (:UNKNOWN . 0))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'MyoPose)))
    "Constants for message type 'MyoPose"
  '((:REST . 1)
    (:FIST . 2)
    (:WAVE_IN . 3)
    (:WAVE_OUT . 4)
    (:FINGERS_SPREAD . 5)
    (:THUMB_TO_PINKY . 6)
    (:UNKNOWN . 0))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MyoPose>) ostream)
  "Serializes a message object of type '<MyoPose>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'pose)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MyoPose>) istream)
  "Deserializes a message object of type '<MyoPose>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'pose)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MyoPose>)))
  "Returns string type for a message object of type '<MyoPose>"
  "bionic_hand/MyoPose")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MyoPose)))
  "Returns string type for a message object of type 'MyoPose"
  "bionic_hand/MyoPose")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MyoPose>)))
  "Returns md5sum for a message object of type '<MyoPose>"
  "056fd823a1b40e3fef451ecc8dcf5690")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MyoPose)))
  "Returns md5sum for a message object of type 'MyoPose"
  "056fd823a1b40e3fef451ecc8dcf5690")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MyoPose>)))
  "Returns full string definition for message of type '<MyoPose>"
  (cl:format cl:nil "# Pose message~%uint8 REST = 1~%uint8 FIST = 2~%uint8 WAVE_IN = 3~%uint8 WAVE_OUT = 4~%uint8 FINGERS_SPREAD = 5~%uint8 THUMB_TO_PINKY = 6~%uint8 UNKNOWN = 0~%uint8 pose~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MyoPose)))
  "Returns full string definition for message of type 'MyoPose"
  (cl:format cl:nil "# Pose message~%uint8 REST = 1~%uint8 FIST = 2~%uint8 WAVE_IN = 3~%uint8 WAVE_OUT = 4~%uint8 FINGERS_SPREAD = 5~%uint8 THUMB_TO_PINKY = 6~%uint8 UNKNOWN = 0~%uint8 pose~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MyoPose>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MyoPose>))
  "Converts a ROS message object to a list"
  (cl:list 'MyoPose
    (cl:cons ':pose (pose msg))
))

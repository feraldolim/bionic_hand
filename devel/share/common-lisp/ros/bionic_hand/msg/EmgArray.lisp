; Auto-generated. Do not edit!


(cl:in-package bionic_hand-msg)


;//! \htmlinclude EmgArray.msg.html

(cl:defclass <EmgArray> (roslisp-msg-protocol:ros-message)
  ((data
    :reader data
    :initarg :data
    :type (cl:vector cl:fixnum)
   :initform (cl:make-array 8 :element-type 'cl:fixnum :initial-element 0))
   (moving
    :reader moving
    :initarg :moving
    :type cl:fixnum
    :initform 0))
)

(cl:defclass EmgArray (<EmgArray>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <EmgArray>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'EmgArray)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name bionic_hand-msg:<EmgArray> is deprecated: use bionic_hand-msg:EmgArray instead.")))

(cl:ensure-generic-function 'data-val :lambda-list '(m))
(cl:defmethod data-val ((m <EmgArray>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader bionic_hand-msg:data-val is deprecated.  Use bionic_hand-msg:data instead.")
  (data m))

(cl:ensure-generic-function 'moving-val :lambda-list '(m))
(cl:defmethod moving-val ((m <EmgArray>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader bionic_hand-msg:moving-val is deprecated.  Use bionic_hand-msg:moving instead.")
  (moving m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <EmgArray>) ostream)
  "Serializes a message object of type '<EmgArray>"
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    ))
   (cl:slot-value msg 'data))
  (cl:let* ((signed (cl:slot-value msg 'moving)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <EmgArray>) istream)
  "Deserializes a message object of type '<EmgArray>"
  (cl:setf (cl:slot-value msg 'data) (cl:make-array 8))
  (cl:let ((vals (cl:slot-value msg 'data)))
    (cl:dotimes (i 8)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'moving) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<EmgArray>)))
  "Returns string type for a message object of type '<EmgArray>"
  "bionic_hand/EmgArray")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'EmgArray)))
  "Returns string type for a message object of type 'EmgArray"
  "bionic_hand/EmgArray")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<EmgArray>)))
  "Returns md5sum for a message object of type '<EmgArray>"
  "926d498bb3e9f898f2a3ff6ed5aff58c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'EmgArray)))
  "Returns md5sum for a message object of type 'EmgArray"
  "926d498bb3e9f898f2a3ff6ed5aff58c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<EmgArray>)))
  "Returns full string definition for message of type '<EmgArray>"
  (cl:format cl:nil "# EmgArray message for the Thalmic Myo, which has 8 EMG sensors ~%# arranged around the arm~%# There is a moving field that's unclear what it is looks like a bitmask~%~%int16[8] data~%int16 moving~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'EmgArray)))
  "Returns full string definition for message of type 'EmgArray"
  (cl:format cl:nil "# EmgArray message for the Thalmic Myo, which has 8 EMG sensors ~%# arranged around the arm~%# There is a moving field that's unclear what it is looks like a bitmask~%~%int16[8] data~%int16 moving~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <EmgArray>))
  (cl:+ 0
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'data) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 2)))
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <EmgArray>))
  "Converts a ROS message object to a list"
  (cl:list 'EmgArray
    (cl:cons ':data (data msg))
    (cl:cons ':moving (moving msg))
))

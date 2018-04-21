;; Auto-generated. Do not edit!


(when (boundp 'ros_myo::MyoPose)
  (if (not (find-package "ROS_MYO"))
    (make-package "ROS_MYO"))
  (shadow 'MyoPose (find-package "ROS_MYO")))
(unless (find-package "ROS_MYO::MYOPOSE")
  (make-package "ROS_MYO::MYOPOSE"))

(in-package "ROS")
;;//! \htmlinclude MyoPose.msg.html


(intern "*REST*" (find-package "ROS_MYO::MYOPOSE"))
(shadow '*REST* (find-package "ROS_MYO::MYOPOSE"))
(defconstant ros_myo::MyoPose::*REST* 1)
(intern "*FIST*" (find-package "ROS_MYO::MYOPOSE"))
(shadow '*FIST* (find-package "ROS_MYO::MYOPOSE"))
(defconstant ros_myo::MyoPose::*FIST* 2)
(intern "*WAVE_IN*" (find-package "ROS_MYO::MYOPOSE"))
(shadow '*WAVE_IN* (find-package "ROS_MYO::MYOPOSE"))
(defconstant ros_myo::MyoPose::*WAVE_IN* 3)
(intern "*WAVE_OUT*" (find-package "ROS_MYO::MYOPOSE"))
(shadow '*WAVE_OUT* (find-package "ROS_MYO::MYOPOSE"))
(defconstant ros_myo::MyoPose::*WAVE_OUT* 4)
(intern "*FINGERS_SPREAD*" (find-package "ROS_MYO::MYOPOSE"))
(shadow '*FINGERS_SPREAD* (find-package "ROS_MYO::MYOPOSE"))
(defconstant ros_myo::MyoPose::*FINGERS_SPREAD* 5)
(intern "*THUMB_TO_PINKY*" (find-package "ROS_MYO::MYOPOSE"))
(shadow '*THUMB_TO_PINKY* (find-package "ROS_MYO::MYOPOSE"))
(defconstant ros_myo::MyoPose::*THUMB_TO_PINKY* 6)
(intern "*UNKNOWN*" (find-package "ROS_MYO::MYOPOSE"))
(shadow '*UNKNOWN* (find-package "ROS_MYO::MYOPOSE"))
(defconstant ros_myo::MyoPose::*UNKNOWN* 0)
(defclass ros_myo::MyoPose
  :super ros::object
  :slots (_pose ))

(defmethod ros_myo::MyoPose
  (:init
   (&key
    ((:pose __pose) 0)
    )
   (send-super :init)
   (setq _pose (round __pose))
   self)
  (:pose
   (&optional __pose)
   (if __pose (setq _pose __pose)) _pose)
  (:serialization-length
   ()
   (+
    ;; uint8 _pose
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _pose
       (write-byte _pose s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _pose
     (setq _pose (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(setf (get ros_myo::MyoPose :md5sum-) "056fd823a1b40e3fef451ecc8dcf5690")
(setf (get ros_myo::MyoPose :datatype-) "ros_myo/MyoPose")
(setf (get ros_myo::MyoPose :definition-)
      "# Pose message
uint8 REST = 1
uint8 FIST = 2
uint8 WAVE_IN = 3
uint8 WAVE_OUT = 4
uint8 FINGERS_SPREAD = 5
uint8 THUMB_TO_PINKY = 6
uint8 UNKNOWN = 0
uint8 pose

")



(provide :ros_myo/MyoPose "056fd823a1b40e3fef451ecc8dcf5690")



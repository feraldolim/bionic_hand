;; Auto-generated. Do not edit!


(when (boundp 'bionic_hand::MyoPose)
  (if (not (find-package "BIONIC_HAND"))
    (make-package "BIONIC_HAND"))
  (shadow 'MyoPose (find-package "BIONIC_HAND")))
(unless (find-package "BIONIC_HAND::MYOPOSE")
  (make-package "BIONIC_HAND::MYOPOSE"))

(in-package "ROS")
;;//! \htmlinclude MyoPose.msg.html


(intern "*REST*" (find-package "BIONIC_HAND::MYOPOSE"))
(shadow '*REST* (find-package "BIONIC_HAND::MYOPOSE"))
(defconstant bionic_hand::MyoPose::*REST* 1)
(intern "*FIST*" (find-package "BIONIC_HAND::MYOPOSE"))
(shadow '*FIST* (find-package "BIONIC_HAND::MYOPOSE"))
(defconstant bionic_hand::MyoPose::*FIST* 2)
(intern "*WAVE_IN*" (find-package "BIONIC_HAND::MYOPOSE"))
(shadow '*WAVE_IN* (find-package "BIONIC_HAND::MYOPOSE"))
(defconstant bionic_hand::MyoPose::*WAVE_IN* 3)
(intern "*WAVE_OUT*" (find-package "BIONIC_HAND::MYOPOSE"))
(shadow '*WAVE_OUT* (find-package "BIONIC_HAND::MYOPOSE"))
(defconstant bionic_hand::MyoPose::*WAVE_OUT* 4)
(intern "*FINGERS_SPREAD*" (find-package "BIONIC_HAND::MYOPOSE"))
(shadow '*FINGERS_SPREAD* (find-package "BIONIC_HAND::MYOPOSE"))
(defconstant bionic_hand::MyoPose::*FINGERS_SPREAD* 5)
(intern "*THUMB_TO_PINKY*" (find-package "BIONIC_HAND::MYOPOSE"))
(shadow '*THUMB_TO_PINKY* (find-package "BIONIC_HAND::MYOPOSE"))
(defconstant bionic_hand::MyoPose::*THUMB_TO_PINKY* 6)
(intern "*UNKNOWN*" (find-package "BIONIC_HAND::MYOPOSE"))
(shadow '*UNKNOWN* (find-package "BIONIC_HAND::MYOPOSE"))
(defconstant bionic_hand::MyoPose::*UNKNOWN* 0)
(defclass bionic_hand::MyoPose
  :super ros::object
  :slots (_pose ))

(defmethod bionic_hand::MyoPose
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

(setf (get bionic_hand::MyoPose :md5sum-) "056fd823a1b40e3fef451ecc8dcf5690")
(setf (get bionic_hand::MyoPose :datatype-) "bionic_hand/MyoPose")
(setf (get bionic_hand::MyoPose :definition-)
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



(provide :bionic_hand/MyoPose "056fd823a1b40e3fef451ecc8dcf5690")



;; Auto-generated. Do not edit!


(when (boundp 'bionic_hand::MyoArm)
  (if (not (find-package "BIONIC_HAND"))
    (make-package "BIONIC_HAND"))
  (shadow 'MyoArm (find-package "BIONIC_HAND")))
(unless (find-package "BIONIC_HAND::MYOARM")
  (make-package "BIONIC_HAND::MYOARM"))

(in-package "ROS")
;;//! \htmlinclude MyoArm.msg.html


(intern "*UNKNOWN*" (find-package "BIONIC_HAND::MYOARM"))
(shadow '*UNKNOWN* (find-package "BIONIC_HAND::MYOARM"))
(defconstant bionic_hand::MyoArm::*UNKNOWN* 0)
(intern "*RIGHT*" (find-package "BIONIC_HAND::MYOARM"))
(shadow '*RIGHT* (find-package "BIONIC_HAND::MYOARM"))
(defconstant bionic_hand::MyoArm::*RIGHT* 1)
(intern "*LEFT*" (find-package "BIONIC_HAND::MYOARM"))
(shadow '*LEFT* (find-package "BIONIC_HAND::MYOARM"))
(defconstant bionic_hand::MyoArm::*LEFT* 2)
(intern "*X_TOWARD_WRIST*" (find-package "BIONIC_HAND::MYOARM"))
(shadow '*X_TOWARD_WRIST* (find-package "BIONIC_HAND::MYOARM"))
(defconstant bionic_hand::MyoArm::*X_TOWARD_WRIST* 11)
(intern "*X_TOWARD_ELBOW*" (find-package "BIONIC_HAND::MYOARM"))
(shadow '*X_TOWARD_ELBOW* (find-package "BIONIC_HAND::MYOARM"))
(defconstant bionic_hand::MyoArm::*X_TOWARD_ELBOW* 12)
(defclass bionic_hand::MyoArm
  :super ros::object
  :slots (_arm _xdir ))

(defmethod bionic_hand::MyoArm
  (:init
   (&key
    ((:arm __arm) 0)
    ((:xdir __xdir) 0)
    )
   (send-super :init)
   (setq _arm (round __arm))
   (setq _xdir (round __xdir))
   self)
  (:arm
   (&optional __arm)
   (if __arm (setq _arm __arm)) _arm)
  (:xdir
   (&optional __xdir)
   (if __xdir (setq _xdir __xdir)) _xdir)
  (:serialization-length
   ()
   (+
    ;; uint8 _arm
    1
    ;; uint8 _xdir
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _arm
       (write-byte _arm s)
     ;; uint8 _xdir
       (write-byte _xdir s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _arm
     (setq _arm (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _xdir
     (setq _xdir (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(setf (get bionic_hand::MyoArm :md5sum-) "18b76488390e8ae3f8451095f1b48ad8")
(setf (get bionic_hand::MyoArm :datatype-) "bionic_hand/MyoArm")
(setf (get bionic_hand::MyoArm :definition-)
      "# Arm message for the Thalmic Myo. Using firmware > 1.0, 
# Thalmic Gesture Recognition is possible after sync gesture is performed.

# arm represents which arm the device is on
uint8 UNKNOWN=0
uint8 RIGHT=1
uint8 LEFT=2
uint8 arm

# xdir represents the direction of the x-axis
# Sharing UNKNOWN=0
uint8 X_TOWARD_WRIST=11
uint8 X_TOWARD_ELBOW=12
uint8 xdir

")



(provide :bionic_hand/MyoArm "18b76488390e8ae3f8451095f1b48ad8")



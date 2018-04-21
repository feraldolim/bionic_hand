;; Auto-generated. Do not edit!


(when (boundp 'bionic_hand::EmgArray)
  (if (not (find-package "BIONIC_HAND"))
    (make-package "BIONIC_HAND"))
  (shadow 'EmgArray (find-package "BIONIC_HAND")))
(unless (find-package "BIONIC_HAND::EMGARRAY")
  (make-package "BIONIC_HAND::EMGARRAY"))

(in-package "ROS")
;;//! \htmlinclude EmgArray.msg.html


(defclass bionic_hand::EmgArray
  :super ros::object
  :slots (_data _moving ))

(defmethod bionic_hand::EmgArray
  (:init
   (&key
    ((:data __data) (make-array 8 :initial-element 0 :element-type :integer))
    ((:moving __moving) 0)
    )
   (send-super :init)
   (setq _data __data)
   (setq _moving (round __moving))
   self)
  (:data
   (&optional __data)
   (if __data (setq _data __data)) _data)
  (:moving
   (&optional __moving)
   (if __moving (setq _moving __moving)) _moving)
  (:serialization-length
   ()
   (+
    ;; int16[8] _data
    (* 2    8)
    ;; int16 _moving
    2
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int16[8] _data
     (dotimes (i 8)
       (write-word (elt _data i) s)
       )
     ;; int16 _moving
       (write-word _moving s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int16[8] _data
   (dotimes (i (length _data))
     (setf (elt _data i) (sys::peek buf ptr- :short)) (incf ptr- 2)
     )
   ;; int16 _moving
     (setq _moving (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;;
   self)
  )

(setf (get bionic_hand::EmgArray :md5sum-) "926d498bb3e9f898f2a3ff6ed5aff58c")
(setf (get bionic_hand::EmgArray :datatype-) "bionic_hand/EmgArray")
(setf (get bionic_hand::EmgArray :definition-)
      "# EmgArray message for the Thalmic Myo, which has 8 EMG sensors 
# arranged around the arm
# There is a moving field that's unclear what it is looks like a bitmask

int16[8] data
int16 moving

")



(provide :bionic_hand/EmgArray "926d498bb3e9f898f2a3ff6ed5aff58c")



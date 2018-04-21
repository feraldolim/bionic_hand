;; Auto-generated. Do not edit!


(when (boundp 'bionic_hand::FingerPosition)
  (if (not (find-package "BIONIC_HAND"))
    (make-package "BIONIC_HAND"))
  (shadow 'FingerPosition (find-package "BIONIC_HAND")))
(unless (find-package "BIONIC_HAND::FINGERPOSITION")
  (make-package "BIONIC_HAND::FINGERPOSITION"))

(in-package "ROS")
;;//! \htmlinclude FingerPosition.msg.html


(defclass bionic_hand::FingerPosition
  :super ros::object
  :slots (_name _position _finger1 _finger2 _finger3 _finger4 _finger5 ))

(defmethod bionic_hand::FingerPosition
  (:init
   (&key
    ((:name __name) (let (r) (dotimes (i 0) (push "" r)) r))
    ((:position __position) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:finger1 __finger1) 0)
    ((:finger2 __finger2) 0)
    ((:finger3 __finger3) 0)
    ((:finger4 __finger4) 0)
    ((:finger5 __finger5) 0)
    )
   (send-super :init)
   (setq _name __name)
   (setq _position __position)
   (setq _finger1 (round __finger1))
   (setq _finger2 (round __finger2))
   (setq _finger3 (round __finger3))
   (setq _finger4 (round __finger4))
   (setq _finger5 (round __finger5))
   self)
  (:name
   (&optional __name)
   (if __name (setq _name __name)) _name)
  (:position
   (&optional __position)
   (if __position (setq _position __position)) _position)
  (:finger1
   (&optional __finger1)
   (if __finger1 (setq _finger1 __finger1)) _finger1)
  (:finger2
   (&optional __finger2)
   (if __finger2 (setq _finger2 __finger2)) _finger2)
  (:finger3
   (&optional __finger3)
   (if __finger3 (setq _finger3 __finger3)) _finger3)
  (:finger4
   (&optional __finger4)
   (if __finger4 (setq _finger4 __finger4)) _finger4)
  (:finger5
   (&optional __finger5)
   (if __finger5 (setq _finger5 __finger5)) _finger5)
  (:serialization-length
   ()
   (+
    ;; string[] _name
    (apply #'+ (mapcar #'(lambda (x) (+ 4 (length x))) _name)) 4
    ;; float64[] _position
    (* 8    (length _position)) 4
    ;; int32 _finger1
    4
    ;; int32 _finger2
    4
    ;; int32 _finger3
    4
    ;; int32 _finger4
    4
    ;; int32 _finger5
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string[] _name
     (write-long (length _name) s)
     (dolist (elem _name)
       (write-long (length elem) s) (princ elem s)
       )
     ;; float64[] _position
     (write-long (length _position) s)
     (dotimes (i (length _position))
       (sys::poke (elt _position i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; int32 _finger1
       (write-long _finger1 s)
     ;; int32 _finger2
       (write-long _finger2 s)
     ;; int32 _finger3
       (write-long _finger3 s)
     ;; int32 _finger4
       (write-long _finger4 s)
     ;; int32 _finger5
       (write-long _finger5 s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string[] _name
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _name (make-list n))
     (dotimes (i n)
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setf (elt _name i) (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
     ))
   ;; float64[] _position
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _position (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _position i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; int32 _finger1
     (setq _finger1 (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _finger2
     (setq _finger2 (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _finger3
     (setq _finger3 (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _finger4
     (setq _finger4 (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _finger5
     (setq _finger5 (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get bionic_hand::FingerPosition :md5sum-) "2ff4dd92cbc5633d3b65693952f22ad1")
(setf (get bionic_hand::FingerPosition :datatype-) "bionic_hand/FingerPosition")
(setf (get bionic_hand::FingerPosition :definition-)
      "string[] name
float64[] position
int32 finger1
int32 finger2
int32 finger3
int32 finger4
int32 finger5



")



(provide :bionic_hand/FingerPosition "2ff4dd92cbc5633d3b65693952f22ad1")



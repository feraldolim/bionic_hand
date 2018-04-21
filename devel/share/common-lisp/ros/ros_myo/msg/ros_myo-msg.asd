
(cl:in-package :asdf)

(defsystem "ros_myo-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "EmgArray" :depends-on ("_package_EmgArray"))
    (:file "_package_EmgArray" :depends-on ("_package"))
    (:file "MyoArm" :depends-on ("_package_MyoArm"))
    (:file "_package_MyoArm" :depends-on ("_package"))
    (:file "MyoPose" :depends-on ("_package_MyoPose"))
    (:file "_package_MyoPose" :depends-on ("_package"))
  ))
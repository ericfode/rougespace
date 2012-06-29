(in-package #:rougespace)

(defclass object ()
  ((can-share :accessor object-can-share
	      :initform nil
	      :initarg :can-share)))

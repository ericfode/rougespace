(in-package #:rougespace)

(defclass Thing (drawable object)
  ((name :accessor thing-name
	:initform "tree"
	:initarg :name)
   (symbol :initform 74)))


(defclass pos ()
  ((x :accessor pos-x
     :initform 0
     :initarg :x)
  (y :accessor pos-y
     :initform 0
     :initarg :y)))

(defmethod draw  ((d Thing) x y)
	   (tcod:console-put-char tcod:*root* 
				  x
				  y
				  (draw-symbol d)
				  :none))

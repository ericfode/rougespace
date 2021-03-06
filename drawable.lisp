(in-package :rougespace)

(defclass Drawable ()
    ((symbol :accessor draw-symbol
	     :initform 40
	     :initarg :symbol)
     (size-x :accessor draw-size-x
	     :initform 1
	     :initarg :size-x)
     (size-y :accessor draw-size-y
	     :initform 1
	     :initarg :size-y)))

;assumes that drawable is on screen

(defmethod draw  ((d Player) x y)
	   (tcod:console-put-char tcod:*root* 
				  x
				  y
				  (draw-symbol d)
				  :none))

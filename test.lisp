(require 'rougespace)

(defun test () 
  (tcod:console-init-root 80 50 "Test" nil :renderer-sdl)
  (tcod:console-set-alignment tcod:*root* :center)
  (tcod:console-print tcod:*root* 40 25 "Creating world !" )
  (tcod:console-set-default-background tcod:*root* (tcod:colour :white))
  (tcod:console-rect tcod:*root* 20 20 30 20 nil :OVERLAY)
  (tcod:console-flush)
  (setf world (buildworld))
  (displaysome 0 0 99 99 world)
  (tcod:console-wait-for-keypress t)
  (tcod:console-delete tcod:*root*))

(test)
(tcod:console-init-root 80 50 "Test" nil :renderer-sdl)
(tcod:console-set-alignment tcod:*root* :center)
(DEFVAR *world*)
(buildworld)
(displaysome 0 0 79 49 *world*)
(tcod:console-flush)
(tcod:console-wait-for-keypress t)
(tcod:console-delete tcod:*root*))

(defun dudewalking())


(defun buildworld()
  (setf *world* (make-array '(1000 1000)))
  (loop for x from 0 to 999 do
       (loop for y from 0 to 999 do
	       (setf (aref *world* x y) (+ (random 3) 24) )))))
)

(buildworld)

(defun displaySome (xs ys h w world)
  (loop for x from 0 to h do 
       (loop for y from 0 to w do
	    (setf char (aref world (+ x xs) (+ y ys)))
	    (tcod:console-put-char tcod:*root* x y char :none))))

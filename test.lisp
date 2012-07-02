
(in-package #:rougespace)


(defun test () 
 (game-loop)
)

(defvar *gameon* t)
(defvar *key*)
  (defvar *camera* (make-instance 'Camera))
  (defvar *world* (make-instance 'World))
  (defvar *player* (make-instance 'Player 
				  :pos (make-instance 'Pos 
						      :x 90
						      :y 90) 
				  :in-world *world*))
(defun game-loop()
 (camera-init *camera*)
 (camera-update *camera* *player* *world*)
 (world-build *world* 300 300)
 (world-spawn-objects-random *world* 900)
 (setf *gameon* t)
 (draw-world *world* *camera*)
 (loop while *gameon* do  
      (print "looping")
      (setf *key* (tcod:console-wait-for-keypress t))
      (when (eq (tcod:key-pressed *key*) t)
	(keyact *key* :up (player-move *player* 0 -1))
        (keyact *key* :down (player-move *player* 0 1))
	(keyact *key* :right (player-move *player* 1 0))
	(keyact *key* :left  (player-move *player* -1 0))
	(keyact *key* :escape  (tcod:console-delete tcod:*root*)
		(setf *gameon* nil)))
      (camera-update *camera* *player* *world*)
      (draw-world *world* *camera*)
      (tcod:console-flush)))



(test)


(in-package #:rougespace)


(defun test () 
 (game-loop)
)


  (defvar *camera* (make-instance 'Camera))
  (defvar *world* (make-instance 'World))
  (defvar *player* (make-instance 'Player 
				  :pos (make-instance 'Pos 
						      :x 100
						      :y 100) 
				  :in-world *world*))

(defun game-loop()
 (camera-init *camera*)
 (world-build *world* 300 300)
 (world-spawn-objects-random *world* 900)
 (setf gameon t)
 (loop while gameon do  
      (setf key (tcod:console-wait-for-keypress t))
      (when (eq (tcod:key-pressed key) t)
	(keyact key :up (player-move *player* 0 -1))
        (keyact key :down (player-move *player* 0 1))
	(keyact key :right (player-move *player* 1 0))
	(keyact key :left  (player-move *player* 1 0))
	(keyact key :escape  (tcod:console-delete tcod:*root*)
			      (setf gameon nil)))
      (camera-update *camera* *player* *world*)
      (draw-world *world* *camera*)
      (tcod:console-flush)))



(test)

(in-package #:rougespace)

(defun inrange (xs ys w h pos)
  (cond ((and 
	 (and (<= (pos-x pos) (+ xs w))
	      (>= (pos-x pos) xs))
	 (and (<= (pos-y pos) (+ ys h))
	      (>= (pos-y pos) ys))) t)
  (t nil)))

(defmacro keyact (inkey actkey &rest body)
    `(when (eq (tcod:key-vk ,inkey) ,actkey)
      ,@body))




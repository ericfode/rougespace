  
(defun draw-interface (ys objects)
  (tcod:console-print tcod:*root* 10 ys "~d objects" (length objects))) 

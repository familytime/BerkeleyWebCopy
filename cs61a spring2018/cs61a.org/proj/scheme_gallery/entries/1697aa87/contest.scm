;;; Scheme Recursive Art Contest Entry
;;;
;;; Please do not include your name or personal info in this file.
;;;
;;; Title: <What can you see?>
;;;
;;; Description:
;;;   <Guess what I want it to be?>

(define (draw)
  ; YOUR CODE HERE
  (draw-tree 0 0 30 3 - + + + "#dcdcdc")
  (penup)
  (color "#5c5c5c")
  (begin_fill)
  (goto 0 0)
  (pendown)
  (goto -28 -45)
  (goto 28 -45)
  (goto 0 0)
  (end_fill)
  (ht)
  (exitonclick))

(define (draw-tree x y size num x_fn1 x_fn2 y_fn1 y_fn2 c)
	(cond ((not (= num 0))
	(draw-sub-tree x y size x_fn1 x_fn2 y_fn1 y_fn2 c)
	;draw tree on top
	(draw-tree (- x size) (+ y (* size (sqrt 3))) (* size 0.6) (- num 1) - + + + "#dcdcdc")
	(draw-tree (+ x size) (+ y (* size (sqrt 3))) (* size 0.6) (- num 1) - + + + "#5c5c5c")
	;draw tree on bottom
	(draw-tree (- x size) (- y (* size (sqrt 3))) (* size 0.6) (- num 1) - + - - "#5c5c5c")
	(draw-tree (+ x size) (- y (* size (sqrt 3))) (* size 0.6) (- num 1) - + - - "#dcdcdc")
	)
))


(define (draw-sub-tree x y size x_fn1 x_fn2 y_fn1 y_fn2 c)
	(penup)
	(goto x y)
	(color c)
	(begin_fill)
	(pendown)
	(goto (x_fn1 x size) (y_fn1 y (* size (sqrt 3))))
	(penup)
	(goto x y)
	(pendown)
	(goto (x_fn2 x size) (y_fn2 y (* size (sqrt 3))))
	(goto (x_fn1 x size) (y_fn1 y (* size (sqrt 3))))
	(end_fill)
	)

; Please leave this last line alone.  You may add additional procedures above
; this line.
(draw)
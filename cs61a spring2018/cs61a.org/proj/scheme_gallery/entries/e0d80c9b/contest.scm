;;; Scheme Recursive Art Contest Entry
;;;
;;; Please do not include your name or personal info in this file.
;;;
;;; Title: Sigh ... Environment Diagrams
;;;
;;; Description:
;;;   What Would Python Show?
;;;   Denero asked knowingly
;;;   Well Daddy, I tried.

(define (draw)
  (penup)
  (right 90)
  (setposition -200 0)
  (envirodiagram-fractal 3 100)
  (exitonclick))



(define (draw-square size) (pendown) (forward size) (right 90) (forward size) (right 90)
	(forward size) (right 90) (forward size) (right 90))

(define (draw-line size) (pendown) (forward size))

(define (draw-branch size angle) (left angle) (draw-line size) (penup)
	(right angle) (forward (/ size 4)) (draw-square (/ size 3)) (forward (/ size 3))
	(draw-square (/ size 3)) (forward (/ size 3)) (draw-square (/ size 3)) (forward (/ size 3))
	(draw-square (/ size 3)) (forward (/ size 3)) (penup) (backward (* 4 (/ size 3)))
	(backward (/ size 4)) (left angle) (backward size) (right angle) )
	

(define (envirodiagram-fractal levels size)
	(if (= levels 1) (begin (draw-branch size 0) (draw-branch size 45) (draw-branch size -45))
		(begin (draw-branch size 0) (forward (+ size (/ size 4) (/ (* 4 size) 3)))
		(envirodiagram-fractal (- levels 1) (/ size 2))
		(backward (+ size (/ size 4) (/ (* 4 size) 3)))
		(draw-branch size 45) (left 45) (forward size) (right 45)
		(forward (+ (* 2 (/ size 4)) (/ (* size 4) 3)))
		(envirodiagram-fractal (- levels 1) (/ size 2))
		(backward (+ (* 2 (/ size 4)) (/ (* size 4) 3)))
		(left 45) (backward size) (right 45)
		(draw-branch size -45) (left -45) (forward size) (right -45)
		(forward (+ (* 2 (/ size 4)) (/ (* size 4) 3)))
		(envirodiagram-fractal (- levels 1) (/ size 2))
		(backward (+ (* 2 (/ size 4)) (/ (* size 4) 3)))
		(left -45) (backward size) (right -45)
		))
	        )

; Please leave this last line alone.  You may add additional procedures above
; this line.
(draw)
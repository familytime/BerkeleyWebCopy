;;; Scheme Recursive Art Contest Entry
;;;
;;; Please do not include your name or personal info in this file.
;;;
;;; Title: Dear Denero
;;;
;;; Description:
;;;   <9 out of 50.
;;;    Dude. I got only nine points.
;;;    Help a brotha out.>

(define (draw)
  ; YOUR CODE HERE
 (bgcolor "light blue")
 (speed 0)

  (c -250 250 80)
  (u -190 250 80)
  (r -130 250 80)
  (v -80 250 80)
  (e 0 250 80)

  (m -250 100 80)
  (i -150 100 80)
  (letter_d -100 100 80)
  (letter_t -60 100 80 )
  (e 0 100 90)
  (r 50 100 90)
  (m 100 100 90)

  (two 0 -50 90)

  (p 115 -50 30)
  (l 130 -50 30)
  (s 150 -75 30)

  ; (letter_d 100 -100 30)
  ; (a 150 -100 30)
  ; (letter_d 200 -100 30)


  (frown -250 -100 80)
  (frown -250 -200 40)
  (frown 100 -100 40)
  (frown -100 -50 90)
  (frown 0 -200 50)
  (frown 250 250 50)
  (frown 200 200 100)
  (frown 200 -140 130)

  (hideturtle)

  (exitonclick))


(define (reset_position startX startY)
	(penup)
	(setposition startX startY)
	(pendown)
	(setheading 0)
	)
(define (c startX startY size)
  	(reset_position startX startY)
  	(setheading 0)
	(backward size)
	(right 90)
	(forward (/ size 2))

	  (penup)
	  (setposition startX startY)
	  (pendown)
  (forward (/ size 2))
  	)

(define (u startX startY size)
	(reset_position startX startY)
	(backward size)
	(right 90)
	(forward (/ size 2))
	(left 90)
	(forward size)
	)

(define (r startX startY size)
	(reset_position startX startY)
	(backward size)
	(penup)
	(forward size)
	(pendown)
	(right 90)
	(circle (/ size -3) 180)
	(left 135)
	(forward (* (- size (* (/ size 3) 2)) 1.41) )
	)

(define (v startX startY size)
	(reset_position startX startY)
	(right 160)
	(forward size)
	(left 140)
	(forward size)
	)

(define (e startX startY size)
	(reset_position startX startY)
	(right 90)
	(forward (/ size 2))
	(backward (/ size 2))
	(right 90)
	(forward (/ size 2))
	(left 90)
	(forward (/ size 2))
	(backward (/ size 2))
	(right 90)
	(forward (/ size 2))
	(left 90)
	(forward (/ size 2))
	)

(define (m startX startY size)
	(reset_position startX startY)
	(backward size)
	(reset_position startX startY)
	(v startX startY size)
	(left 20)
	(backward size)
	)

(define (i startX startY size)
	(reset_position startX startY)
	(right 90)
	(forward (/ size 2))
	(reset_position (+ startX (/ size 4)) startY)
	(backward size)
	(reset_position startX (- startY size))
	(right 90)
	(forward (/ size 2))
	)

(define (letter_d startX startY size)
	(reset_position startX startY)
	(right 90)
	(circle (/ size -2) 180)
	(right 90)
	(forward size)

	)

(define (letter_t startX startY size)
	(reset_position startX startY)
	(right 90)
	(forward (/ size 2))
	(reset_position (+ startX (/ size 4)) startY)
	(backward size)
	)

(define (two startX startY size)
	(reset_position startX startY)
	(circle (/ size -3) 180)
	(right 40)
	(forward size)
	(left 130)
	(forward (/ size 1.5))
	)

(define (frown startX startY size)
	(reset_position startX startY)
	(right 90)
	(circle (/ size -2) 360)
	(reset_position (- startX (/ size 6)) (- startY (/ size 3)))
	(backward (/ size 8))
	(reset_position (+ startX (/ size 6)) (- startY (/ size 3)))
	(backward (/ size 8))

	(reset_position (- startX (/ size 4)) (- startY (/ size 1.2)))
	(circle (/ size -4) 180)
	)

(define (p startX startY size)
	(reset_position startX startY)
	(backward size)
	(reset_position startX startY)
	(right 90)
	(circle (/ size -4) 180)
	)

(define (l startX startY size)
	(reset_position startX startY)
	(backward size)
	(right 90)
	(forward (/ size 3))
	)

(define (s startX startY size)
	(reset_position startX startY)
	(right 90)
	(circle (/ size 4) 180)
	(circle (/ size -4) 180)
	)
; (define (a startX startY size)
; 	(reset_position startX startY)
; 	(right 20)
; 	(backward size)
; 	(reset_position startX startY)
; 	(left 20)
; 	(backward size)
; 	(reset_position (- startX (/ size 3)) (- startY (/ size 2)))
; 	(right 90)
; 	(forward (/ size 2))
; 	)

; Please leave this last line alone.  You may add additional procedures above
; this line.
(draw)
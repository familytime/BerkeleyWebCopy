;;; Scheme Recursive Art Contest Entry
;;;
;;; Please do not include your name or personal info in this file.
;;;
;;; Title: <Your title here>
;;;
;;; Description:
;;;   <It's your masterpiece.
;;;    Use these three lines to describe
;;;    its inner meaning.>

(define (star len clr size)
	(if (> len 0)
		(begin
			(color clr)
			(forward size)
			(right 50)
			(backward size)
			(right 50)
			(star (- len 10) clr size))
	)
)

(define (draw)
  ; YOUR CODE HERE
  (bgcolor "#000000")
  (star 200 "#FFB6B9" 300)
  (penup)
  (setposition 30 30)
  (pendown)
  (star 200 "#FAE3D9" 400)
  (penup)
  (setposition 210 20)
  (pendown)
  (star 200 "#BBDED6" 450)
  (penup)
  (setposition -200 20)
  (pendown)
  (star 200 "#61C0BF" 200)
  (penup)
  (hideturtle)
  (exitonclick))

; Please leave this last line alone.  You may add additional procedures above
; this line.
(draw)
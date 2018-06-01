;;; Scheme Recursive Art Contest Entry
;;;
;;; Please do not include your name or personal info in this file.
;;;
;;; Title: <Taking an L on this Extra Credit>
;;;
;;; Description:
;;;   <My dear Denero
;;;    I try hard in your class but
;;;    All I have are Ls>
from turtle import *
(define (L size c num)

  (if (< num 4) (setheading 180) (setheading 90))
  (penup)
  (color c)
  (pendown)
  (begin_fill)
  (forward 25)
  (left 90)
  (forward 5)
  (left 90)
  (forward 25)
  (left 90)
  (forward 5)
  (left 90)
  (end_fill)
  (penup)
  (forward 25)
  (if (< num 5)(L size c (+ num 1)) ())
  )
(define (draw)
  (define (recdraw x y n)
    (define c 0)
    (penup)
    (speed 10)
    (setposition (+ x 10) (+ y 37.5))
    (pendown)
    (changesize 0.2 0.2 0.2)

    (if (= n 3.14) (define c (1 - c)) nil
     )
    (L 100 (rgb c c c) 0)
    (recdraw (+ x (* 100 (cos n))) (+ y (* 100 (sin n))) (+ n (/ 3.14 6)))
    )
    (recdraw 100 100 90)
  (exitonclick)
  )

; Please leave this last line alone.  You may add additional procedures above
; this line.
(draw)

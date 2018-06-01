;;; Scheme Recursive Art Contest Entry
;;;
;;; Please do not include your name or personal info in this file.
;;;
;;; Title: Daddy DeNero's Deathly Hallows
;;;
;;; Description:
;;;   <The Elder Wand that could write out any code.
;;;    The Resurrection Stone that could correct any bug.
;;;    The Invisibility Cloak that could shield everyone in 61A.>

(define (draw)
  (bgcolor "black")
  (color "white")
  (penup)
  (right 90)
  (forward 100)
  (left 90)
  (pendown)
  (circle 100)
  (penup)
  (backward 100)
  (pendown)
  (left 90)
  (forward (+ (/ (- (* 200 (sqrt 3)) 200) 2) 200))
  (penup)
  (right 120)
  (pendown)
  (forward (* 200 (sqrt 3)))
  (penup)
  (right 120)
  (pendown)
  (forward (* 200 (sqrt 3)))
  (penup)
  (right 120)
  (pendown)
  (forward (/ (- (* 200 (sqrt 3)) 200) 2))
  (penup)
  (forward 100)
  (right 90)
  (pendown)
  (forward 300)
  (ht)
  (exitonclick))

; Please leave this last line alone.  You may add additional procedures above
; this line.
(draw)
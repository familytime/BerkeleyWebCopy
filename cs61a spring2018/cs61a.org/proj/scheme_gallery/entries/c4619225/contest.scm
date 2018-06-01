;;; Scheme Recursive Art Contest Entry
;;;
;;; Please do not include your name or personal info in this file.
;;;
;;; Title: Packing
;;;
;;; Description:
;;;    It looks like an eye?
;;;    Far too many shades of green
;;;    Post-modernism


(define (square times)
  (if (< times 0) ()
    (begin
      (forward 30)
      (right 90)
      (square (- times 1))
      )))

(define (stripes times)
  (if (< times 0) ()
    (begin
      (left 45)
      (forward 5)
      (left 135)
      (forward 30)
      (right 135)
      (forward 5)
      (right 45)
      (forward 30)
      (stripes (- times 1)))))

(define (left_square)
  (begin
    (forward 30)
    (left 45)
    (forward 30)
    (left 135)
    (forward 30)
    (stripes 2)
    (right 45)
    (forward 30)
    (setheading 0)))
(define (right_square)
  (begin
    (left 45)
    (forward 30)
    (right 45)
    (forward 30)
    (right 135)
    (forward 30)))
(define (one_block x)
  (begin
    (setheading 0)
    (right 135)
    (color "white")
    (begin_fill)
    (square 4)
    (end_fill)
    (color (rgb 0.5 0.9 x))
    (begin_fill)
    (right_square)
    (end_fill)
    (color "white")
    (left 45)
    (forward 30)
    (left 135)
    (left_square)))
(define (right_top times col)
  (if (< times 0) ()
    (begin
      (one_block col)
      (right 135)
      (forward 30)
      (right 45)
      (forward 30)
      (setheading 0)
      (right_top (- times 1) (+ .05 col)))))
(define (right_bottom times col)
  (if (< times 0) ()
    (begin
      (one_block col)
      (left 135)
      (forward 30)
      (left 45)
      (forward 30)
      (setheading 0)
      (right_bottom (- times 1) (+ .05 col)))))
(define (left_top times col)
  (if (< times 0) ()
    (begin
      (left 135)
      (forward 30)
      (left 45)
      (forward 30)
      (setheading 0)
      (one_block col)
      (left_top (- times 1) (+ .05 col)))))
(define (left_bottom times col)
  (if (< times 0) ()
    (begin
      (right 135)
      (forward 30)
      (right 45)
      (forward 30)
      (setheading 0)
      (one_block col)
      (left_bottom (- times 1) (+ .05 col)))))

(define (draw)
  (speed 0)
  (bgcolor "black")
  (penup)
  (forward 250)
  (color "white")
  (pendown)
  (right_top 4 .2)
  (left 135)
  (forward 30)
  (right 90)
  (forward 30)
  (setheading 0)
  (right_bottom 3 .3)
  (penup)
  (setposition 0 0)
  (forward 250)
  (pendown)
  (left_top 3 .4)
  (left_bottom 2 .5)

  (penup)
  (setposition 0 0)
  (forward (- 190 (sqrt 1800)))
  (pendown)
  (right_top 2 .05)
  (left 135)
  (forward 30)
  (right 90)
  (forward 30)
  (setheading 0)
  (right_bottom 1 .15)
  (penup)
  (setposition 0 0)
  (forward (- 190 (sqrt 1800)))
  (pendown)
  (left_top 1 .25)
  (left_bottom 0 .35)



  (exitonclick))

; Please leave this last line alone.  You may add additional procedures above
; this line.
(draw)

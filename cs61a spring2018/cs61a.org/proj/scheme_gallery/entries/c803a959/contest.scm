;;; Scheme Recursive Art Contest Entry
;;;
;;; Please do not include your name or personal info in this file.
;;;
;;; Title: Circle of Life (aka a lotta circles)
;;;
;;; Description:
;;;    Circle a Circle
;;;    Circle nine circles around
;;;    Draw random lines; art

(define (randone x)
  (define g (+ x 0.2))
  (under_one g)
)
(define (randtwo x)
  (define g (+ x 0.3))
  (under_one g)
)
(define (randthree x)
  (define g (+ x 0.4))
  (under_one g)
)

(define (under_one x)
  (if (> x 1) (/ x 10) x)
)

(define (draw)
  (ht)
  (speed 0)
  (bgcolor "wheat")
  (define (drawcircle r)
    (penup)
    (right 90) (forward r) (right 270)
    (pendown)
    (begin_fill)
    (circle r)
    (end_fill)
    (right 270) (forward r) (right 90)
  )
  (define (looper r ratio red green blue dis)
    (color (rgb red green blue))
    (cond
      ((< r 1)
        (right 110) (pendown) (forward dis) (penup) (left 110)
        )
      (else
    (penup)
    (forward (+ r (/ r ratio)))
    (pendown)
    (begin_fill)
    (drawcircle (/ r ratio))
    (end_fill)
    (penup)
    (looper (/ r ratio) ratio (randone red) (randtwo green) (randthree blue) dis)
  ))
  )
  (color "black")
  (drawcircle 100)
  (color "white")
  (drawcircle 40)
  (define (nine func r ratio n red green blue dis)
    (cond
      ((= n 0) )
      (else (func r ratio red green blue dis) (setposition 0 0) (right (/ 360 9)) (nine func r ratio (- n 1) (randone red) (randtwo green) (randthree blue) dis))
  ))
  (nine looper 100 1.9 9 .1 .3 .5 220)
  (nine looper 40 2.3 9 .4 .6 .8 68.4)
  (exitonclick))

; Please leave this last line alone.  You may add additional procedures above
; this line.
(draw)

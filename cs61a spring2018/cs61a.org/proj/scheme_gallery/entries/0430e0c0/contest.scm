;;; Scheme Recursive Art Contest Entry
;;;
;;; Please do not include your name or personal info in this file.
;;;
;;; Title: Poseidon's Kiss
;;;
;;; Description:
;;; Not even toilet paper
;;; Can fend against
;;; The Splash of Poseidon's kiss
(define colorful (cons-stream "red" (cons-stream "orange" (cons-stream "yellow"
    (cons-stream "green" (cons-stream "blue" (cons-stream "purple" colorful)))))))


(define (bigcircles x y colored stop angle)
    (penup)
    (pendown)
    (color (car colored))
    (begin_fill)
    (circle x)
    (end_fill)
    (left angle) ;155, 180; 210 amazing,25, 270
    (if (or (< y 0) (<= x stop)) (circle stop)
    (bigcircles (- x 0.5) y (cdr-stream colored) stop angle)))

(define (star x size colored angle)
    (setposition 0 0)

    (pendown)
    (color (car colored))
    (forward size)
    (left angle)
    (backward size)
    (if (or (< size 0) (<= x 0)) (circle 0)
    (star (- x 1) size (cdr-stream colored) angle)))

(define (repeatcircles x y color)
    (bigcircles x y color 0 angle)
    (if (or (<= x 0) (<= y 0)) (bigcircles x y color 0 angle)
    (repeatcircles (- x 25) (- y 25) color)))
(define (draw)
    (bgcolor "black")
    (speed 0)
    (pendown)
    (star 750 1000 colorful 0.5)
    (setposition 0 0)
    (bigcircles 150 0 colorful 0 215)
    (hideturtle)




  (exitonclick)
)

; Please leave this last line alone.  You may add additional procedures above
; this line.
(draw)

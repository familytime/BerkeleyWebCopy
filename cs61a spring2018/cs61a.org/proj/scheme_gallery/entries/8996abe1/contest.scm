;;; Scheme Recursive Art Contest Entry
;;;
;;; Please do not include your name or personal info in this file.
;;;
;;; Title: I Love Hue
;;;
;;; Description:
;;;   Hexagon, circle
;;;   It doesn't matter to me
;;;   Because I Love Hue

(define (draw)
 (define (circles x y radius r g b)
  (if (< radius 2) (penup)
   (begin
    (penup)
    (setposition x y)
    (pendown)
    (color (rgb r g b))
    (circle radius)
    (circles (- x (* radius 1.5)) y (/ radius 2) (- r .15) g b);left
    (circles (- x radius) (+ y (* radius (sin 1.04))) (/ radius 2) (- r .15) g (- b .15) );upper left
    (circles x (+ y (* radius (sin 1.04))) (/ radius 2) r g (- b .15));upper right
    (circles (+ x (/ radius 2)) y (/ radius 2) r (- g .15) (- b .15));right
    (circles x (- y (* radius (sin 1.04))) (/ radius 2) r (- g .15) b);lower right
    (circles (- x radius) (- y (* radius (sin 1.04))) (/ radius 2) (- r .15) (- g .15) b);lower left
    )))
 (speed 0)
 (bgcolor "#000000")
 (hideturtle)
 (circles 150 0 150 1 1 1)
)

; Please leave this last line alone.  You may add additional procedures above
; this line.
(draw)
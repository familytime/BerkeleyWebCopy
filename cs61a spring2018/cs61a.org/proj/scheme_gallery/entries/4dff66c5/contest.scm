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

(define num-iter 30)

(define bg-r 0.133333)
(define bg-g 0.172490)
(define bg-b 0.2392156)
(define bg-color (rgb bg-r bg-g bg-b))

(define earth-r 0.76078431)
(define earth-g 0.76470588)
(define earth-b 0.76862745)
(define earth-color (rgb earth-r earth-g earth-b))

(define r-step (/ (- earth-r bg-r) num-iter))
(define g-step (/ (- earth-g bg-g) num-iter))
(define b-step (/ (- earth-b bg-b) num-iter))


(define (rectangle x y thickness length col)
    (penup)
    (setposition x y)
    (pendown)
    (color col)
    (begin_fill)
    (setheading 180)
    (forward thickness)
    (setheading 90)
    (forward length)
    (setheading 0)
    (forward thickness)
    (setheading 270)
    (forward length)
    (end_fill)
)

(define (dent)
    (penup)
    (setposition -90 140)
    (pendown)
    (color bg-color)
    (begin_fill)
    (circle 55)
    (end_fill)
)

(define rect-thickness 2)
(define gap 2)
(define rad 200)
(define sub-constant 70)

; returns negative x-coordinate
(define (get-x y)
    (* -1 (sqrt (- (* rad rad) (* y y))))
)

(define (max-chord y)
    (cond (( <= ( - (* rad rad) (* y y)) 0) 0)
        (else
            (floor (* 2 (sqrt ( - (* rad rad) (* y y)))))
         )
     )
)

(define (min-chord y)
    (cond (( <= (- (max-chord y) sub-constant) 0) 0)

        (else (- (max-chord y) sub-constant)))
)

(define (rects num x y)
    (cond ((= num 0) 0)
        (else
            (rectangle x y rect-thickness (randint (min-chord y) (max-chord y)) earth-color)
            (rects (- num 1) (get-x (+ y (+ rect-thickness gap))) (+ y (+ rect-thickness gap)))
         )
    )
)

(define (midlines)
    (rectangle (* -1 rad) -15 20 (* 2 rad) bg-color)
    (rectangle (* -1 rad) -23 3 (* 2 rad) earth-color)
)

(define (draw)
    (speed 0)
    (bgcolor bg-color)
    (rects 100 0 (* -1 rad))
    (dent)
    (midlines)
    (hideturtle)
    (save-image)
    (exitonclick)
)

; Please leave this last line alone.  You may add additional procedures above
; this line.
(draw)
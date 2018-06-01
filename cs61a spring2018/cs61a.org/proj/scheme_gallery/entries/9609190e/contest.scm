;;; Scheme Recursive Art Contest Entry
;;;
;;; Please do not include your name or personal info in this file.
;;;
;;; Title: Recursive Rubik's Cubes
;;;
;;; Description:
;;;   rubik's cubes are cool;
;;;   but are they not cooler when
;;;   they're recursive cubes?


(define (cadr s) (car (cdr s)))

; draw a single quadrilateral face of a single cube (not actually
; drawing a square despite the function name, oops)
(define (draw-square angle color-name start-angle len)
          (color color-name)(begin_fill)(setheading start-angle)
          (forward len)
          (setheading (+ start-angle 90 angle))
          (forward (* 0.9 len))
          (setheading 0)
          (forward len)
          (setheading (+ (- start-angle 90) angle))
          (forward (* 0.9 len))
          (end_fill)

)

; draw the top face of a single cube
(define (draw-top angle color-name start-angle len)
          (color color-name)
          (begin_fill)
          (setheading start-angle)
          (forward len)
          (setheading (+ start-angle 90 angle))
          (forward len)
          (setheading (* -1 (- 90 angle)))
          (forward len)
          (setheading (- 90 angle))
          (forward (* 1 len))
          (end_fill)
)

; draw a single cube (not recursive or nested) using draw-square and draw-top
(define (draw-cube startx starty size-provided color-list)
        (begin (penup)(define size size-provided)
            (setposition startx starty)
            (pendown)
            (draw-square 30 (car color-list) 180 size)
            (define color-list (cdr-stream color-list))
            (draw-square 150 (car color-list) 180 size)
            (define color-list (cdr-stream color-list))
            (setposition startx (+ starty (* 0.9 size)))
            (draw-top 30 (car color-list) 120 (* 0.9 size))
            (define color-list (cdr-stream color-list))
            (penup)
        )

)

; colors to alternate between (blue, red, yellow)
(define colors (cons-stream '"#3399ff" (cons-stream
                  '"#ff3300" (cons-stream '"#ffff4d" colors))))

; draw a cube with n recursively nested sub-cubes inside it
(define (nested-squares n max-size originx originy colors)
          (penup)
          (define spacing (/ max-size n))
          (define original-n n)
          (pendown)
          (define (helper n colors)
              (cond  ((= n 0) nil)
                     (else (draw-cube originx originy (- max-size
                                  (* (- original-n n) spacing)) colors)
                            (helper (- n 1) (cdr-stream colors))
                     )
              )
          ) (helper n colors)
)

; draw a line of recursively-nested cubes
(define (cube-line startx starty gap n b)
          (cond ((= n 0) nil)
                (else (nested-squares (+ b (modulo n 3)) 140 (+ startx gap) starty colors)
                      (cube-line (+ startx gap) starty gap (- n 1) b))
          )
)

; ---------------------------------------------------------------------------
;                             MAIN DRAW FUNCTION
; ---------------------------------------------------------------------------

; Warning: the drawing will be pretty large (I needed to use a 22+ inch monitor
; to view the whole thing in the Scheme Turtle window). I made the image large
; in an attempt to avoid aliasing. When I drew the image smaller, the diagonal
; lines forming the edges of the cubes looked really jagged. Making the image
; larger mitigated this aliasing pretty well.

(define (draw)
  (bgcolor '"#330033")
    (speed 10)
    (penup)
    (cube-line -578 350 280 3 1)
    (cube-line -578 35 280 3 2)
    (cube-line -578 -280 280 3 3)
    (hideturtle)
    (exitonclick)
)

; Please leave this last line alone.  You may add additional procedures above
; this line.


(draw)

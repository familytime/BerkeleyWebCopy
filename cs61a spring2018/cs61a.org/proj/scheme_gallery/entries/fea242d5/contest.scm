;;; Scheme Recursive Art Contest Entry
;;;
;;; Please do not include your name or personal info in this file.
;;;
;;; Title: <It's Bears all the way down>
;;;
;;; Description:
;;;   <If C's Get Degrees,
;;;    what will my Cal major be?
;;;    Upvote for B+!>

(define (draw)

  (define route
    '( 0 94 42 191 48 413 47 192 43 314 43 192 47 413 48 191 42 96 90 129 90 44 -42 85 312 298 -47 86
       -43 210 -42 86 -48 298 -47 84 -43 48 90 129 90  0)
  )
  
  (define (walk directions scale)
    (begin
      (left (car directions))
      (forward (* scale (car (cdr directions))))
      (if (pair? (cdr (cdr directions)))
        (walk (cdr (cdr directions)) scale)
      )
    )
  )

  (define (recursive_draw x y red green blue scale reduction)
    (if (> scale 0.01)
      (begin
        (penup)
        (color (rgb red green blue))
        (setposition x y)
        (pendown)
        (begin_fill)
        (walk route scale)
        (end_fill)
        (recursive_draw (* x reduction) (* y reduction) (* red .8) (* green .8) (* blue .8) (* scale reduction) reduction)

      )
    )
  )
  (bgcolor "#003262")
  (define red (/ 253 256))
  (define green (/ 181 256))
  (define blue (/ 21 256))
  (hideturtle)
  (define scale 1.5)
  (define x (* 336 scale))
  (define y (* 63 scale))
  (define reduction .5)
  (recursive_draw x y red green blue scale reduction)
  (exitonclick)
)

; Please leave this last line alone.  You may add additional procedures above
; this line.
(draw)

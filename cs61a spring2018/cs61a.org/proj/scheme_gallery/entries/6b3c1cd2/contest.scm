;;; Scheme Recursive Art Contest Entry
;;;
;;; Please do not include your name or personal info in this file.
;;;
;;; Title: Patrick's Phenomenon
;;;
;;; Description:
;;;    You wrote this code? Yup.
;;;    So you know how it works? Nope.
;;;    -Everyone in CS61A

(define (draw)
  ; YOUR CODE HERE
  (define (drawer n)
    (if (= 0 n )
      (begin
        (color "green")
        (circle 69)
      )
      (begin
        (color "red")
        (circle (* n 5) (* 100 (modulo n 2)))
        (setposition (+ 30 n ) (* n -2))
        (color "blue")
        (setposition n (* -5 n))
        (drawer (- n 1))
      )
    )
  )
  (define (drawer2 n)
    (if (= 0 n)
      (begin
        (color "purple")
        (setposition 69 69)
        (circle 30 120)
        (color "orange")
        (backward 30)
        (bgcolor "black")
      )
      (begin
        (color "green")
        (circle (+ n 30) (* 120 (modulo n 2)))
        (color "yellow")
        (setposition (- -200 n) (- n 30))
        (drawer2 (- n 5))
      )
    )
  )
  (define (drawer3 n)
    (if (= 0 n)
      (begin
        (color "white")
        (setposition 27 20)
        (circle 13 (- 360 (modulo n 10)))
      )
      (begin
        (color "cyan")
        (circle n (- 360 (* (expt (/ 1 2) n) 100)))
        (drawer2 5)
        (drawer3 (- n 1))
      )
    )
  )
  (speed 10)
  (drawer3 7)
  (drawer 60)
  (drawer2 70)
  (exitonclick)
)

; Please leave this last line alone.  You may add additional procedures above
; this line.
(draw)

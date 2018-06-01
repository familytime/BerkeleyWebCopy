;;; Scheme Recursive Art Contest Entry
;;;
;;; Please do not include your name or personal info in this file.
;;;
;;; Title: Californian Circles
;;;
;;; Description:
;;;    This was accident.
;;;    Many hours I did work.
;;;    Blue and gold, go Bears!

(define (draw)
  (speed 10)
  (define (circles radius)
    (circle radius)
      (cond ((> radius 100) (color "blue") (circles (- radius 2)))
            ((> radius 50) (color "gold") (circles (- radius 2)))
            ((> radius 1) (color "blue") (circles (- radius 2)))
            ((< radius -100) (color "gold") (circles (+ radius 2)))
            ((< radius -50) (color "blue") (circles (+ radius 2)))
            ((< radius -1) (color "gold") (circles (+ radius 2)))
      )
  )

  (color "blue")
  (circles 150)
  (color "gold")
  (circles -150)
  (color "white")
  (setposition 0 -225)
  (color "gold")
  (circles 75)
  (color "blue")
  (circles -75)
  (color "white")
  (setposition 0 225)
  (color "gold")
  (circles 75)
  (color "blue")
  (circles -75)

  (exitonclick))

  ; (define (fibonacci n)
  ;   (cond ((= n 1) 1)
  ;         ((= n 2) 1)
  ;         (else (+ (fibonacci (- n 1)) (fibonacci (- n 2))))
  ;   )
  ; )
  ; (define (fib_spiral n)
  ;   (circle (fibonacci n) 90)
  ;   (cond ((< n 14) (fib_spiral (+ n 1))))
  ; )

  ; (cond ((> radius 144) (color "magenta") (circles (- radius 2)))
  ;       ((> radius 89) (color "black") (circles (- radius 2)))
  ;       ((> radius 55) (color "red") (circles (- radius 2)))
  ;       ((> radius 34) (color "orange") (circles (- radius 2)))
  ;       ((> radius 21) (color "yellow") (circles (- radius 2)))
  ;       ((> radius 13) (color "green") (circles (- radius 2)))
  ;       ((> radius 8) (color "blue") (circles (- radius 2)))
  ;       ((> radius 5) (color "indigo") (circles (- radius 2)))
  ;       ((> radius 3) (color "violet") (circles (- radius 2)))
  ;       ((> radius 2) (color "magenta") (circles (- radius 2)))
  ;       ((> radius 1) (color "black") (circles (- radius 2)))
  ;       ((< radius -1) (color "black") (circles (+ radius 2)))
  ;       ((< radius -2) (color "magenta") (circles (+ radius 2)))
  ;       ((< radius -3) (color "violet") (circles (+ radius 2)))
  ;       ((< radius -5) (color "indigo") (circles (+ radius 2)))
  ;       ((< radius -8) (color "blue") (circles (+ radius 2)))
  ;       ((< radius -13) (color "green") (circles (+ radius 2)))
  ;       ((< radius -21) (color "yellow") (circles (+ radius 2)))
  ;       ((< radius -34) (color "orange") (circles (+ radius 2)))
  ;       ((< radius -55) (color "red") (circles (+ radius 2)))
  ;       ((< radius -89) (color "black") (circles (+ radius 2)))
  ;       ((< radius -144) (color "magenta") (circles (+ radius 2)))
  ; )

; Please leave this last line alone.  You may add additional procedures above
; this line.
(draw)

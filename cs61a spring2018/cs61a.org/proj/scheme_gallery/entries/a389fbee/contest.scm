;;; Scheme Recursive Art Contest Entry
;;;
;;; Please do not include your name or personal info in this file.
;;;
;;; Title: <Circles are Cool>
;;;
;;; Description:
;;;   <Made with white circles
;;;    Looks pretty terrifying
;;;    Like 61A...>

(define (draw)
  (bgcolor (rgb 0 0 0))
  (define (helper x y)
            (penup)
            (cond ((and (= x 625) (= y -455)) (exitonclick))
                  ((= x 625) (helper -455 (- y 30)))
                  (else (setposition x y) (pendown) (color "white") (circle 130)
                        (helper (+ x 30) y))))
(helper -455 535))

; Please leave this last line alone.  You may add additional procedures above
; this line.
(draw)

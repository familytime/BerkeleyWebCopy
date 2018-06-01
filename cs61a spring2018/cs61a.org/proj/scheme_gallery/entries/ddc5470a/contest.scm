;;; Scheme Recursive Art Contest Entry
;;;
;;; Please do not include your name or personal info in this file.
;;;
;;; Title: Goyard Bag Full Of Parentheses
;;;
;;; Description:
;;;   <All the money in
;;;    the world would not be enough
;;;    for me to like Scheme.>

(define (draw)
  (speed 0)
  (bgcolor "#010101")
  (define (onethird)
    (begin_fill)
      (right 300)
      (forward 119)
      (right 120)
      (forward 32)
      (right 60)
      (forward 87)
      (right 300)
      (forward 87)
      (right 60)
      (forward 32)
      (right 120)
      (forward 119)
    (end_fill))
  (define (whole x y)
    (penup)
    (setposition x y)
    (pendown)
    (color '"#fdfdfe")
    (onethird)
    (color '"#37322f")
    (onethird)
    (color '"#99826f")
    (onethird))
  (whole 0 0)
  (define (many n x y)
    (if (= 0 n)
      (penup)
      (begin
        (whole x (- y 152))
        (whole (+ x 133) (+ y 76))
        (whole (- x 133) (+ y 76))
        (begin
          (many (- n 1) x (+ y 152))
          (many (- n 1) (+ x 133) (- y 76))
          (many (- n 1) (- x 133) (- y 76))))))
  (many 5 0 0)
  (exitonclick))

; Please leave this last line alone.  You may add additional procedures above
; this line.
(draw)

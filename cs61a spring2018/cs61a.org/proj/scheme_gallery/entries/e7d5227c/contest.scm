;;; Scheme Recursive Art Contest Entry
;;;
;;; Please do not include your name or personal info in this file.
;;;
;;; Title: Persevere
;;;
;;; Description:
;;;   <My undeclared friends: 
;;;    Work hard and we can do it
;;;    Let's ace this final>

(define (draw)
  (penup) (goto -200 100) (rt 90) (pendown)
  (three)
  (penup) (goto -70 -110) (pendown)
  (begin_fill) (circle 10) (end_fill)
  (penup) (goto -20 100) (rt 270) (pendown)
  (three)
  (ht)
  (exitonclick))

(define (three)
  (begin_fill) (fd 90) (rt 90) (fd 90) (rt 90) (fd 90) (lt 90) (fd 20)
    (lt 90) (fd 90) (rt 90) (fd 90) (rt 90) (fd 90) (lt 90) (fd 20) (lt 90)
    (fd 110) (lt 90) (fd 240) (lt 90) (fd 110) (lt 90) (fd 20)
    (end_fill)
  )
; Please leave this last line alone.  You may add additional procedures above
; this line.
(draw)
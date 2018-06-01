;;; Scheme Recursive Art Contest Entry
;;;
;;; Please do not include your name or personal info in this file.
;;;
;;; Title: <Cold and Blue>
;;;
;;; Description:
;;;   <凉凉
;;;    "Cold"
;;;    This means "Screwed up" in Chinese.>

(hideturtle)

(define (tree r)
  (if (< r 10) (begin (forward r) (back r))
  (begin
    (forward (/ r 3))
    (left 30)
    (tree (* (/ r 3) 2))
    (right 30)
    (back (/ r 3))

    (forward (/ r 2))
    (right 27)
    (tree (/ r 2))
    (left 27)
    (back (/ r 2))

    (forward (* (/ 2 3) r))
    (right 25)
    (tree (/ r 2))
    (left 25)
    (back (* r (/ 2 3))))))


(bgcolor "#AFD7FF")

(define (draw)
  (speed 10)
  (color "#0000FF")
  (tree 200)
  (rt 60)
  (color "#3A90FF")
  (tree 200)
  (rt 60)
  (color "#0000FF")
  (tree 200)
  (rt 60)
  (color "#3A90FF")
  (tree 200)
  (rt 60)
  (color "#0000FF")
  (tree 200)
  (rt 60)
  (color "#3A90FF")
  (tree 200)
  (rt 90)
  (color "#FFFFFF")
  (tree 100)
  (rt 60)
  (color "#FFFFFF")
  (tree 100)
  (rt 60)
  (color "#FFFFFF")
  (tree 100)
  (rt 60)
  (color "#FFFFFF")
  (tree 100)
  (rt 60)
  (color "#FFFFFF")
  (tree 100)
  (rt 60)
  (color "#FFFFFF")
  (tree 100)
  (rt 60)
  (exitonclick))

; Please leave this last line alone.  You may add additional procedures above
; this line.
(draw)

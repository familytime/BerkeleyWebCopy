;;; Scheme Recursive Art Contest Entry
;;;
;;; Please do not include your name or personal info in this file.
;;;
;;; Title: Orange-ish
;;;
;;; Description:
;;;   <If Mr. Small Hands can catch the Storm(y),
;;;    these wonderful circles
;;;    can catch first place.>

(define (circles len)

  (cond 
  	((= 10 len) (circle 10))
  	(else (begin (circle len) (circles (- len 10))))
  	)
  )
(bgcolor "orange")
(define (draw)
	(color "red")
  (circles 150)
  (left 90)
  (color "blue")
  (circles 150)
  (left 90)
  (color "white")
  (circles 150)
  (left 90)
  (color "green")
  (circles 150)
  
  (exitonclick))

; Please leave this last line alone.  You may add additional procedures above
; this line.
(draw)
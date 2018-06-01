;;; Scheme Recursive Art Contest Entry
;;;
;;; Please do not include your name or personal info in this file.
;;;
;;; Title: <Summer Rose Fantasy>
;;;
;;; Description:
;;;   <I drew one thousand roses.
;;;    Pick the best of them.
;;;    Only for your secret summer fantasy.>

(define (draw)
  ; YOUR CODE HERE
  (exitonclick))
  (define n 500)
  (define (move k)
  	(cond ((> k 500) null)
  		((> k 380) 
  		  (begin
	          (rgb_color 245 170 160)
	  		  (pen_width (/ k 150)) 
	  		  (forward (+k 30))
	  		  (left 71)
	  		  (move (+ 1 k))
  			))

  		((> k 275) 
  		  (begin
	          (rgb_color 163 24 24)
	  		  ;(pen_width 1) 
	  		  (forward (+ k 25))
	  		  (left 71)
	  		  (move (+ 1 k))
  			))
  		((> k 200) 
  		  (begin
	          (rgb_color 71 10 10)
	  		  (pen_width (/ k 80))
	  
	  		  (forward (+ k (remainder k 5)))
	  		  (left 65)
	  		  (move (+ 1 k))
  			))
  		((> k 100) 
  		  (begin
	          (rgb_color 163 24 24)
	  		  (pen_width 2.5) 
	  		  (forward k)
	  		  (left 61)
	  		  (move (+ 1 k))
  			))
  		((> k 58) 
  		  (begin
	          (rgb_color 71 10 10)
	  		  (pen_width 2) 
	  		  (forward k)
	  		  (left 61)
	  		  (move (+ 1 k))
  			))
  		(else 
  		  (begin
	          (rgb_color 163 24 24)
	  		  (pen_width 3) 
	  		  (forward k)
	  		  (left 48)
	  		  (move (+ 1 k))
  			))

  		)

  	)
  (rgb_background 0 0 0)
  (move 1)

; Please leave this last line alone.  You may add additional procedures above
; this line.
(draw)
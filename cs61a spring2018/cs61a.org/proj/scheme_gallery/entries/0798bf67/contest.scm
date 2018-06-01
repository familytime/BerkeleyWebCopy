;;; Scheme Recursive Art Contest Entry
;;;
;;; Please do not include your name or personal info in this file.
;;;
;;; Title: Plato's Multiverse
;;;
;;; Description:
;;;    infinitely many universes as snowflakes
;;;    yet each hosts only three classes of humans:
;;;    "lovers of wisdom, lovers of honour, and lovers of gain".

(define (draw)
	(define (whole-art x y size depth)

	    (define (four fn)
	    		(fn) (lt 60) (fn) (rt 120) (fn) (lt 60) (fn))


	    (define (koch d k)
	        (four (lambda ()
	               (if (= k 1) (fd d) (leg1 d k)))))

	    (define (leg1 d k)
	        (koch (/ d 3) (- k 1))
	    )

	    (define (complete-koch len iter)
	    		(koch len iter)
	    		(right 120)
	    		(koch len iter)
	    		(right 120)
	    		(koch len iter)
	    )

	    (define (repeat k fn)
	        (if (> k 0)
	            (begin (fn) (repeat (- k 1) fn))
	            nil))

	    (define (hexagon length)
	        (pendown)
	        (repeat 6 (lambda () 
	                     (fd length)
	                     (rt 60)))
	        (penup))

	    (define (hexagons length levels)
	        (hexagon length)
	        (if (> levels 1)
	            (repeat 3 (lambda ()
	                         (hexagons (/ length 2) (- levels 1))  
	                         (repeat 2 (lambda ()
	                              (fd length)
	                              (rt 60)))))))
	    (penup)
	    (setpos x y)
	    (right 90)
	    (pendown)
	    (bgcolor "black")
	    (hideturtle)
	    (speed 100)
	    (color "white")
	    (complete-koch (* 2 size) 4)
	    (penup)
	    (setpos (+ x (* 3 size)) (- y (* 1.74 size)))
	    (pendown)
	    (color "red")
	    (hexagons size depth)
	    (lt 120)
	    (color "orange")
	    (hexagons size depth)
	    (lt 120)
	    (color "purple")
	    (hexagons size depth)
	    (lt 90)
	)
	(whole-art -300 180 100 7)
	(whole-art 300 330 10 4)
	(whole-art 410 0 10 4)
	(whole-art 380 -250 10 4)
	(whole-art -600 200 10 4)
	(whole-art -500 60 10 4)
	(whole-art -600 -70 10 4)
	(whole-art -400 -200 10 4)
	(whole-art -300 300 10 4)
	(whole-art 500 170 10 4)
	(exitonclick))

; Please leave this last line alone.  You may add additional procedures above
; this line.
(draw)
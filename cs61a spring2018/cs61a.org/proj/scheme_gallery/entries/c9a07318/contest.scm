;;; Scheme Recursive Art Contest Entry
;;;
;;; Please do not include your name or personal info in this file.
;;;
;;; Title: <Unexpected?>
;;;
;;; Description:
		
;;;   <It's my masterpiece.
;;;    Yet had something else in mind
;;;    when starting this piece.>



(define (square times cycle)
		(cond 
			((= cycle 12) nil)
			((= times 0) (hex 50 (+ 1 cycle) ))
			(else
				(color "medium purple")
				(pendown)
				(forward (+ times 100))
				(rt 90.911)
				(square (- times 1) cycle )

			)
		)
	)


(define (hex times cycle )
	(cond 
		(( = times 0) (square 100 (+ 1 cycle) ))
		(else
			(pendown)
			(color "MediumOrchid4")
			(forward (+ times 10))
			(rt 60.911)
			(forward (+ (* 2 times) 10 ))
			(rt 60.911)
			(hex (- times 1) cycle )
		)
	)
)





(define (square2 times cycle)
		(cond 
			((= cycle 6) nil)
			((= times 0) (hex2 50 (+ 1 cycle)))
			(else
				(pendown)
				(color "dark cyan")
				(forward (+ times 100))
				(rt 120.911)
				(forward (+ times 50))
				(rt 120.911)
				(square2 (- times 1) cycle)

			)
		)
	)


(define (hex2 times cycle)
	(cond 
		(( = times 0) (square2 10 (+ 1 cycle)))
		(else
			(pendown)
			(color "Dark Turquoise")
			(forward (+ times 10))
			(rt 120.911)
			(forward (+ (* 2 times) 10 ))
			(rt 120.911)
			(hex2 (- times 1) cycle)
		)
	)
)
	

(define (leaf size level)
	(cond 
		((= level 0)  nil)
		(else
			(pendown)

			(forward (* (/ 2 3) size))
			(rt 60)
			(leaf (* size 0.5) (- level 1))
			(lt 60)

			(forward (* (/ 1 3) size))
			(lt 60)
			(leaf (* size 0.5) (- level 1))
			(rt 60)

			(rt 7)
			(leaf (* size 0.5) (- level 1))
			(lt 7)
			(forward (* (/ -1 3) size))
			
			(leaf (* size 0.5) (- level 1))
			(forward (* (/ -2 3) size))
		)
	)

)



(bgcolor "black")
(define (draw)
	(speed 0)

	(square 100 0 ) ; sakura 1 
	
	(penup)
	(forward 100)
	(lt 90)
	(forward 100)

	(square2 10 0)

	(penup)
	(rt -45)
	(forward 200)
	(lt 45)
	(forward 150)
	(lt 180)
	(rt 30)
	(lt 90)
	(forward 250) ;left 
	(lt 90)
	(forward 500) ;down
	(rt 200)


	(color "DeepSkyBlue")
	(leaf 250 7)


(exitonclick)
)

; Please leave this last line alone.  You may add additional procedures above
; this line.
(draw)
;;; Scheme Recursive Art Contest Entry
;;;
;;; Please do not include your name or personal info in this file.
;;;
;;; Title: Fiat Lux 150
;;;
;;; Description:
;;;    Fifteen Stars, Fifteen Rays of Light
;;;    Each for a Decade You Illuminated the World 
;;;    Alma Mater

(define (draw)
	;;; BEGIN EVERYTHING ;;;
	(hideturtle) ; to look good

	;;; Define point of golden section in image ;;;
	(define gx -170)
	(define gy 95)

	;;; Define lists of color gradients ;;;
	(define calgold-white
		(list "#FDB515" "#FDBA25" "#FDBF36" "#FDC447" "#FDCA57" "#FDCF68" "#FDD479" "#FEDA8A" 
					"#FEDF9A" "#FEE4AB" "#FEE9BC" "#FEEFCC" "#FEF4DD" "#FEF9EE" "#FFFFFF")
	)

	(define (reverse lst)
		(if
			(null? lst)
			nil
			(append (reverse (cdr lst)) (list (car lst)))
		)
	)

	(define white-calgold (reverse calgold-white))
	;;; END OF COLOR DEFINITION ;;;

	;;; Berkeley Blue! ;;;
	(bgcolor "#003262")

	;;; Draw a star at (X, Y) of length LEN
	;;; and fill with color COL.
	(define (star x y len col)
		(pu)
		(goto x y)
		(seth 216)
		(forward
			(/
				(/ len 2)
				0.9510565163
			)
		)
		(seth 18)
		(pd)

		(begin_fill)
		(color col)
		(define (draw-n n l angle) ; forward l, turn right angle, repeat n times
			(if
				(> n 0)
				(begin
					(forward l)
					(right angle)
					(draw-n (- n 1) l angle)
				)
			)
		)
		(draw-n 5 len 144)
		(end_fill)

		(pu)
		(goto x y)
		(seth 324)
		(forward 
			(*
				len
				0.201
			)
		)
		(seth 90)
		(pd)

		(begin_fill)
		(draw-n 5 (* len 0.237) 72)
		(end_fill)
	)
	;;; END OF STAR FUNCTION ;;;

	;;; Recursively draw star within a
	;;; star, shrink by STEP and use a
	;;; different color COL each time.
	(define (star-in-star x y len step col)
		(if
			(and (> len 0) (pair? col))
			(begin
				(star x y len (car col))
				(star-in-star x y (- len step) step (cdr col))
			)
		)
	)

	(star-in-star gx gy 128 8 calgold-white)
	;;; END OF STAR-IN-STAR FUNCTION ;;;

	;;; Draw 15 little stars at random locations ;;;
	(define x-coords
		(list -58	-656 -234	-605 -484	312 -195 -354 -328 -422 467 186 321 -211 509)
	)

	(define y-coords
		(list 303	71 -116	-323 211 -337	354	-49	-12	-354 -67 224 301 -352 -258)
	)

	(define (small-star xs ys len)
		(if
			(and (pair? xs) (pair? ys))
			(begin
				(star (car xs) (car ys) len (car calgold-white))
				(small-star (cdr xs) (cdr ys) len)
			)
		)
	)
	(small-star x-coords y-coords 10)
	;;; END OF SMALL-STAR FUNCTION ;;;

	;;; Draw one ray originating from (X, Y) &
	;;; pointing towards direction HEADING
	;;; with gradient COL (each lasting LEN).
	;;; Leave a hollow circle of radius HOLD.
	(define (ray x y heading col len hold)
		(if
			(<= heading 360)
			(begin
				(pu)
				(goto x y)
				(seth heading)
				(forward hold)
				(pd)
				; gradient colors
				(define (gradient col len)
					(if
						(null? (cdr col))
						(begin
							(color (car col))
							(forward (* 1 (screen_width)))
						)
						(begin
							(color (car col))
							(forward len)
							(gradient (cdr col) len)
						)
					)
				)
				(gradient col len)
			)
		)	
	)
	;;; END OF RAY FUNCTION ;;;

	;;; Draw 15 rays originating from (X, Y)
	;;; starting from direction HEADING
	;;; with appropriate parameters
	(define (rays n heading x y col len hold)
		(if
			(and (> n 0) (<= heading 360))
			(begin
				(ray x y heading col len hold)
				(rays (- n 1) (+ heading 24) x y col len hold)
			)
		)
	)
	(rays 15 0 gx gy white-calgold 20 80)
	;;; END OF RAYS FUNCTION ;;;
	;;; END OF EVERYTHING ;;;
  (exitonclick))

; Please leave this last line alone.  You may add additional procedures above
; this line.
(draw)
;;; Scheme Recursive Art Contest Entry
;;;
;;; Please do not include your name or personal info in this file.
;;;
;;; Title: Shooting Stars
;;;
;;; Description:
;;;   <I love shooting stars
;;;    But she moves so fast when she
;;;    falls; I'll be waiting>

(define (draw)
	(speed 100)
	; Colors of background from bottom to top
	(define bg-colors (list 
		"#78deed" "#40aded" "#227ce1" "#1758d1" ; medium-blues
		"#1f36e2" "#172bc4" "#0C20B7" "#080baa" "#000190")) ; dark-blues and purples
  (background -400 -115 400 -50 bg-colors)
  ; call (hills) for each row of hills
  (hills -240 -200 150 5 "#95e540")
  (hills -352 -235 150 5 "#7aff38")
  (hills -240 -270 150 5 "#65ff1a")
  (hills -352 -305 150 5 "#61d619")
  (hills -240 -340 150 5 "#50ba10")
  (hills -352 -375 150 5 "#43a309")
  (moon)
  ; Stars: 18 for angle for upright star
  (star -200 180 8 32)
  (star -275 80 4 20) 
  (star -300 300 2 8) 
  (star -60 270 4 4) 
  (star 10 170 3 40)
  (star 220 90 5 0) 
  (star 270 285 3 50) 
  (star-trail -195 178)
  (hideturtle)
  (exitonclick)
)

(define (background x1 y1 x2 y2 bg-colors)
	(rectangle x1 y1 x2 y2 (car bg-colors)) 
	(if (null? (cdr bg-colors))
			nil
			(background x1 (+ y1 50) x2 (+ y2 50) (cdr bg-colors)) ; Height of rect: 50
	)
  (penup)
)
; Draws a row of hills
(define (hills x y r n c)
	(draw-hills x y r c)
	(if (= n 0)
			nil
			(hills (+ x (* r 1.6)) y r (- n 1) c)
	)
)

(define (draw-hills x y r c)
	(setposition x y)
	(pendown)
	(begin_fill)
	(color c)
	(circle r)
	(end_fill)
	(penup)
)

(define (moon)
	(color "#eeeeee")
	(setposition 200 220)
	; moon
	(pendown) (begin_fill) (circle 25) (penup) (end_fill)
	; craters 
	(penup) (setposition 190 212) (pendown) (begin_fill) (color "#bbbbbb") (circle 2) (end_fill)
	(penup) (setposition 175 205) (pendown) (begin_fill) (color "#bbbbbb") (circle 4) (end_fill)
	(penup) (setposition 171 230) (pendown) (begin_fill) (color "#bbbbbb") (circle 3) (end_fill)
	(penup)
)

; Draws a star where the bottom-right point is at (x, y), the length of each
; leg is len long, and the angle that the first leg is draw at is angle degrees.
(define (star x y len angle)
	(setposition x y)
	(left angle)
	(color "#ffffff")
	(pendown)
	(begin_fill)
	(define (draw-sides len n)
		(forward len) (right 72) (forward len) (left 144) 
		(if (= n 1)
			nil
			(draw-sides len (- n 1))
		)
	)
	(draw-sides len 5)
	(end_fill)
	(penup)
)

; Create a set of 3 star trail lines with the uppermost trail starting at (x, y)
(define (star-trail x y)
	(right 120)
	(color "#eeeeee")
	(right 180)
	(setposition x y) (pendown) (circle 80 60) (penup)
	(right 67) (setposition (- x 8) (- y 4)) (pendown) (circle 100 67) (penup)
	(right 73) (setposition (- x 17) (- y 5)) (pendown) (circle 140 64) (penup)
)

; Makes rectangle with two sets of coordinates of opposite corners
; of rectangles
(define (rectangle x1 y1 x2 y2 c)
	(color c)
	(penup)
	(setposition x1 y1)
	(pendown)
	(begin_fill)
	(setposition x1 y2)
	(setposition x2 y2)
	(setposition x2 y1)
	(setposition x1 y1)
	(end_fill)
	(penup)
)

; Please leave this last line alone.  You may add additional procedures above
; this line.
(draw)
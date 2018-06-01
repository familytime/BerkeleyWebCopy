;;; Scheme Recursive Art Contest Entry
;;;
;;; Please do not include your name or personal info in this file.
;;;
;;; Title: <285>
;;;
;;; Description:
;;;   <Just cause I wrote it
;;;		Doesn't mean I know anything
;;;		About how it works>

(define e 2.718281828459)

(define (spiral x y increment count)
	(color (rgb 1 (* 0.00025 count) 0))
	(define (dx x)
		(* e (+ (sin x) (* x (cos x)))))
	(define (dy y)
		(* 1 (+ (cos y) (* y (sin y)))))
	(right (dx x))
	(forward (- (dy y)))
	(if (< 2500 count)
		(penup)
		(spiral (+ x (* increment (dx x))) (+ y (* increment (dy y))) increment (+ count 1)))
	
	)

(define (draw)
  (pixelsize 5)
  (define (f p q a)
    (define r (expt (+ (expt (- q (/ (screen_height) 2)) 2) (expt (- p (/ (screen_width) 2)) 2)) 0.5))
   

    (pixel p q (rgb a a a))
   
    (cond
      
     
      ((< q (screen_height)) (f p (+ q 1) (* r 0.008)))
      ((< p (screen_width)) (f (+ p 1) 0 (* r 0.008)))

  ))
  (f 0 0 0)
  (setposition (/ (screen_height) 2) (/ (screen_width) 2))
  
  (pendown)
  (speed 10)
  
  (spiral (/ (screen_height) 2) (/ (screen_width) 2) 0.00001 0)
  
  
  (exitonclick))

; Please leave this last line alone.  You may add additional procedures above
; this line.
(draw)
;;; Scheme Recursive Art Contest Entry
;;;
;;; Please do not include your name or personal info in this file.
;;;
;;; Title: Fibonacci's Snowflake
;;;
;;; Description:
;;;   <round and round circles
;;;		go, recursive petals form
;;;		purple flake of snow>
; returns xth element of lst
(define (cxr lst x)
	(if (eq? x 0) (car lst) (cxr (cdr lst) (- x 1))))

(define rainbow '("purple" "violet" "purple" "violet" "purple" "violet"))
; returns the kth fibonacci number
(define (fib k)
	(cond
	((eq? k 0) 1)
	((eq? k 1) 1)
	(else (+ k (fib (- k 1))))
		))


(define (draw)
(speed 0)
(ht)
(bgcolor "black")

; draws n circles of radius fibo at heading fibo
(setposition 0 0)
(define (drawer n m z)


(define col (cxr rainbow (modulo m 6)))
(define fibo (fib m))

(color col)
	(if (eq? n m) (begin (seth (+ fibo z)) (circle fibo))
		(begin (seth (+ fibo z)) (circle fibo) (drawer n (+ m 1) z)))
	)
(drawer 30 10 0)
(drawer 30 10 90)
(drawer 30 10 180)
(drawer 30 10 270)
(exitonclick))
(draw)
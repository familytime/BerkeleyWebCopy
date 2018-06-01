; Code as data

(define (fact n) 
  (if (= n 0) 1 (* n (fact (- n 1)))))

(define (fact-exp n)
  (if (= n 0) 1 (list '* n (fact-exp (- n 1)))))

(define (fib n)
  (if (<= n 1) n (+ (fib (- n 2)) (fib (- n 1)))))

(define (fib-exp n)
  (if (<= n 1) n (list '+ (fib-exp (- n 2)) (fib-exp (- n 1)))))


; Macros

(print 2)
(begin (print 2) (print 2))
(define (twice expr) (list 'begin expr expr))
(twice (print 2))
(twice '(print 2))
(eval (twice '(print 2)))

(define-macro (twice expr) (list 'begin expr expr))

(define x -2)
(define (check val) (if val 'Passed 'Failed))
(check (> x 0))
(define-macro (check expr) (list 'if expr ''Passed ''Failed))
(check (> x 0))
(define-macro (check expr) (list 'if expr ''Passed (list 'quote (list 'Failed:  expr))))
(check (> x 0))

; For

(define (map fn vals) 
  (if (null? vals) 
      () 
      (cons (fn (car vals)) 
            (map fn (cdr vals)))))

(map (lambda (x) (* x x)) '(2 3 4 5))

(define-macro (for sym vals expr)
  (list 'map (list 'lambda (list sym) expr) vals))

(for x '(2 3 4 5) (* x x))

; Quasi-quoting

(define b 2)
'(a b c)
`(a b c)
`(a ,b c)
`(a ,(+ b 5) c)
; `(a b ,c)
(define-macro (check expr) `(if ,expr 'Passed '(Failed: ,expr)))
(check (> -2 0))

(define d (list 3 4 5))
`(a ,b c ,d e)
`(a ,b c ,@d e)

(define-macro (for sym vals exprs)
  `(map (lambda (,sym) ,@exprs) ,vals))

(for x '(2 3 4 5) ((print x) (* x x)))

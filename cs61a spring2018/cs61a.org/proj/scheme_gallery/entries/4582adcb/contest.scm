;;; Scheme Recursive Art Contest Entry
;;;
;;; Please do not include your name or personal info in this file.
;;;
;;; Title: Rainbow Mountains
;;;
;;; Description:
;;;    In the pouring rain,
;;;    The mountains seem to bow down.
;;;    Yet they still loom proud.

(define (draw)
  (bgcolor (rgb 0 0 0))
  ;size of circle
  (define d 100)
  ;how many circles a rainbow lasts before cycling
  (define pamt 90)
  ;how many circles
  (define times 3)
  ;the spacing between each line
  (define density 5)
  ;when do the circles stop filling in
  (define end 30)
  ;styles -- either w, m, or r
  (define wmr (cons-stream 'w (cons-stream 'm (cons-stream 'r wmr))))

  ;circle color
  (define (paint n pamt)
  ; n - (int) the loop number we're on
  ; pamt - (int) how many loop numbers a rainbow lasts

    (define famt (/ pamt 4))
    (cond
      ((< n famt) (color (rgb 1 (/ n famt) 0)))
      ((< n (/ pamt 2)) (color (rgb (- 1 (/ (- n famt) famt)) 1 0)))
      ((< n (* famt 3)) (color (rgb 0 (- 1 (/ (- n (/ pamt 2)) famt)) 1)))
      ((< n pamt) (color (rgb (/ (- n (* famt 3)) famt) 0 1)))
      (else (paint (- n pamt) pamt))))

  ;circles
  (define (loop n density wmr)
  ; n - (int) the loop number we're on
  ; density - (int) n/density = number of loops; how close the circles are
  ; wmr - (str) what kind of circle

    (paint n pamt)
    (cond
      ((eq? wmr 'm)
        (penup)
        (left 90)
        (forward density)
        (right 90)
        (pendown)
        (circle n))
      ((eq? wmr 'w)
        (circle (* n -1)))
      (else (circle n)))
    (if (> n end) (loop (- n density) density wmr)))

  ;circle column
  (define (loopdeloop n times density up wmr)
  ; n - (int) the loop number we're on
  ; times - (int) how many circles in the column
  ; density - (int) n/density = number of loops; how close the circles are
  ; up - (bool) whether the column is being formed up or down
  ; wmr - (str) what kind of circle

    (loop n density wmr)
    (penup)
    (if (eq? wmr 'm)
          (mpos))
    (cond
      ((= times 1)
          (endpos wmr)
          (pendown))
      (up
          (forward (* d 2))
          (pendown)
          (loopdeloop n (- times 1) density up wmr))
      (else (back (* d 2))
            (pendown)
            (loopdeloop n (- times 1) density up wmr))))

  ;circle row
  (define (rowloop rows wmr up)
  ; rows - (int) the number of rows
  ; wmr - (cons-stream) a list of the style in each row
  ; up - (bool) whether we're forming up or down
  ; first - (bool) if this is the first row or not
    (if (eq? (car wmr) 'w)
          (rowmove))
    (if (eq? (car wmr) 'm)
          (mrowmove))
    (loopdeloop d times density up (car wmr))
    (if (> rows 1)
      ((rowmove)(rowloop (- rows 1) (cdr-stream wmr) (not up)))))


  ;moving to the next row
  (define (rowmove)
    (penup)
    (left 90)
    (forward (* d 2))
    (right 90)
    (pendown))

  ;moving to the next row for m-style
  (define (mrowmove)
    (penup)
    (right 90)
    (forward density)
    (left 90)
    (pendown))

  ;positioning for m-style -- affects the position of each row (m)
  (define (mpos)
    (right 90)
    (forward (+ (- d end) density))
    (left 90))

  ;reset end position--affects how far apart the columns are
  (define (endpos wmr)
  ; wmr - (str) what kind of circle
    (cond
      ((eq? wmr 'm)
        (left 90)
        (forward density)
        (right 90))
      ((eq? wmr 'w)
        (right 90)
        (forward (* d 2))
        (left 90))))

  ;start
  (back 200)
  (right 90)
  (forward 300)
  (left 90)
  (hideturtle)

  (rowloop 3 wmr #t)
  (exitonclick))
; Please leave this last line alone.  You may add additional procedures above
; this line.
(draw)

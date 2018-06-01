;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; Scheme Recursive Art Contest Entry
;;;
;;; Please do not include your name or personal info in this file.
;;;
;;; Title: <Your title here>
;;;
;;; Description:
;;;   <It's your masterpiece.
;;;    Use these three lines to describe
;;;    its inner meaning.>

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; Main Procedure

;;; Draw on the canvas.
(define (draw)
  ; Set
  (speed 0)
  (bgcolor "#737373")
  (hideturtle)

  ; Action
  (computer 13 width height 5)
  (hearts)
  (exitonclick))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; Alias/Customization to Primitives

;;; Screen Width
(define width (screen_width))

;;; Screen Height
(define height (screen_height))

;;; Life and move the pen to (x, y).
(define (at x y) (penup) (goto x y))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; Main Components on the Canvas

;;; Draw a computer of given proportion wrt screen width and height times time.
(define (computer proportion width height times)
  (cond
    ((<= times 0) nil)
    (else (begin
      (at (- (* (/ width proportion) 4)) (* (/ height proportion) 3.25))
      (color "#bfbfbf")
      (pendown)
      (begin_fill)
      (setheading 90)
      (forward (* (/ width proportion) (/ 80 proportion)))
      (right 90)
      (forward (* (/ height proportion) (/ 50 proportion)))
      (right 90)
      (forward (* (/ width proportion) (/ 80 proportion)))
      (right 90)
      (forward (* (/ height proportion) (/ 50 proportion)))
      (right 180)
      (forward (* (/ height proportion) (/ 50 proportion)))
      (setheading 240)
      (forward (* (/ width proportion) (/ 30 proportion)))
      (left 60)
      (forward (* (/ height proportion) (/ 5 proportion)))
      (left 90)
      (forward (* (/ width proportion) (/ 132 proportion)))
      (left 90)
      (forward (* (/ height proportion) (/ 5 proportion)))
      (left 60)
      (forward (* (/ width proportion) (/ 30 proportion)))
      (left 30)
      (forward (* (/ width proportion) (/ 80 proportion)))
      (left 30)
      (forward (* (/ width proportion) (/ 30 proportion)))
      (left 150)
      (forward (* (/ width proportion) (/ 132 proportion)))
      (end_fill)
      (penup)
      (computer (* proportion 2) width height (- times 1))))))

;;; Draw the hearts with respect to the center of the canvas.
(define (hearts)
  (define (repeat-heart mininum size step)
    (if (> size mininum)
      (begin
        (heart size 0 0)
        (repeat-heart mininum (- size step) step)
      )
    )
  )
  (repeat-heart 10 200 10))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; Heart

;;; Draw a heart of the given size with respect to (x, y).
(define (heart size cx cy)
  (at cx cy)
  (color "red")
  (draw-heart size top-heart-y 1)
  (draw-heart size bot-heart-y 0))

;;; Draw the heart in the given direction using the given formula.
(define (draw-heart size get-y clockwise)
  (define (helper size x get-y continue? step)
    (if (continue? x)
      (begin
        (at (* x size) (* (get-y 1 x) size))
        (setheading 0)
        (pendown)
        (circle 5)
        (penup)
        (helper size (+ x step) get-y continue? step)
      )
    )
  )
  (if (= clockwise 1)
    (begin
      (define start -1)
      (define (continue? x) (<= x 1))
      (define step 0.1)
    )
    (begin
      (define start 1)
      (define (continue? x) (>= x -1))
      (define step -0.1)
    )
  )
  (helper size start get-y continue? step))

;;; Draw the top half of the heart.
(define (top-heart-y size x)
  (* 0.5 size (expt (- 1 (expt (- (abs (/ (* 2 x) size)) 1) 2)) 0.5)))

;;; Draw the bottom half of the heart.
(define (bot-heart-y size x)
  (* -1.3 size (expt (- 1 (expt (/ (abs x) size) 0.5)) 0.5)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; Main Procedure Call

; Please leave this last line alone.  You may add additional procedures above
; this line.
(draw)

;;; Scheme Recursive Art Contest Entry
;;;
;;; Please do not include your name or personal info in this file.
;;;
;;; Title: daddy's rainbow wonderland!!!!!!!!1
;;;
;;; Description:
;;;    across the rainbow
;;;    lies a pot of gold
;;;    therein lies dear daddy's code
(define rainbow
  (list
   "#ff0000" "#ff0500" "#ff0a00" "#ff0f00" "#ff1400"
   "#ff1800" "#ff1d00" "#ff2200" "#ff2700" "#ff2c00"
   "#ff3100" "#ff3600" "#ff3b00" "#ff4000" "#ff4400"
   "#ff4900" "#ff4e00" "#ff5300" "#ff5800" "#ff5d00"
   "#ff6200" "#ff6700" "#ff6b00" "#ff7000" "#ff7500"
   "#ff7a00" "#ff7f00" "#ff8400" "#ff8900" "#ff8e00"
   "#ff9300" "#ff9800" "#ff9d00" "#ffa100" "#ffa600"
   "#ffab00" "#ffb000" "#ffb500" "#ffba00" "#ffbf00"
   "#ffc400" "#ffc900" "#ffce00" "#ffd300" "#ffd800"
   "#ffdd00" "#ffe100" "#ffe600" "#ffeb00" "#fff000"
   "#fff500" "#fffa00" "#ffff00" "#f5ff00" "#ebff00"
   "#e2ff00" "#d8ff00" "#ceff00" "#c4ff00" "#baff00"
   "#b1ff00" "#a7ff00" "#9dff00" "#93ff00" "#89ff00"
   "#7fff00" "#76ff00" "#6cff00" "#62ff00" "#4eff00"
   "#45ff00" "#3bff00" "#31ff00" "#27ff00" "#1dff00"
   "#14ff00" "#0aff00" "#00ff00" "#00ff0a" "#00ff14"
   "#00ff1d" "#00ff27" "#00ff31" "#00ff3b" "#00ff45"
   "#00ff4e" "#00ff58" "#00ff62" "#00ff6c" "#00ff76"
   "#00ff80" "#00ff89" "#00ff93" "#00ff9d" "#00ffa7"
   "#00ffb1" "#00ffba" "#00ffc4" "#00ffce" "#00ffd8"
   "#00ffe2" "#00ffeb" "#00fff5" "#00ffff" "#00f5ff"
   "#00ebff" "#00e2ff" "#00d8ff" "#00ceff" "#00c4ff"
   "#00baff" "#00b1ff" "#00a7ff" "#009dff" "#0093ff"
   "#0089ff" "#007fff" "#0076ff" "#006cff" "#0062ff"
   "#0058ff" "#004eff" "#0045ff" "#003bff" "#0031ff"
   "#0027ff" "#001dff" "#0014ff" "#000aff" "#0000ff"
   "#0500ff" "#0b00ff" "#1000ff" "#1500ff" "#1b00ff"
   "#2000ff" "#2500ff" "#2b00ff" "#3000ff" "#3500ff"
   "#3b00ff" "#4000ff" "#4500ff" "#4b00ff" "#5000ff"
   "#5600ff" "#5b00ff" "#6000ff" "#6600ff" "#6b00ff"
   "#7000ff" "#7600ff" "#7b00ff" "#8000ff" "#8600ff" "#8b00ff")
  )

(define (mypassion)
  (setposition -300 -100)
  (write 'cs)
  (setposition -240 -100)
  (write 'is)
  (setposition -195 -100)
  (write 'my)
  (setposition -120 -100)
  (write 'passion)
)

(define (stripes x c)
  (if
    (or (null? c) (> x 360)) nil
    (begin (setposition x -336)
    (color (car c))
    (begin_fill)
    (rectangle 4.5 675)
    (end_fill)
    (stripes (+ x 4.5) (cdr c)))
  )
)

(define (rectangle horizontal vertical)
  (seth 0)
  (pendown)
  (define (twosides)
    (forward vertical)
    (right 90)
    (forward horizontal)
    (right 90)
  )
  (twosides)
  (twosides)
)

(define (glasses)
  (seth 180)
  (left 37)
  (pendown)
  (color "black")
  (forward 12) ;left ear thing
  (define (frame)
    (seth 0)
    (backward 10)
    (rectangle 40 20)
    (penup)
    (forward 10)
    (right 90)
    (forward 40)
  )
  (frame)
  (pendown)
  (forward 6) ;middle thing
  (frame)
  (pendown)
  (seth 0)
  (right 37)
  (pendown)
  (forward 12) ;right ear thing
  (penup)
)

(define (turtleline len)
  (if (< len 10) (begin (stamp) (forward len))
    (begin (stamp)
    (forward 10)
    (turtleline (- len 10)))
  )
)

(define (righttriangle horizontal vertical)
  (begin_fill)
  (forward vertical)
  (right 90)
  (forward horizontal)
  (end_fill)
  (backward horizontal)
  (left 90)
  (backward vertical)
)

(define (johns-face)
  (seth 0)
  ;(color "#ffd9b3")
  (color "#ffceb4")
  (begin_fill)
  (circle 50 180)
  (forward 40)
  (circle 50 180)
  (forward 40)
  (end_fill)
  (backward 16)
  (left 90)
  (forward 100)
  (glasses)
  (backward 12)
  (seth -90)
  (forward 20)
  (dot 5 'black)
  (forward 46)
  (dot 5 'black)
  (backward 23)
  (seth 180)
  (forward 20)
  (pendown)
  ;nose
  (right 30)
  (forward 10)
  (seth 90)
  (forward 5)
  ;end nose
  (penup)
  (right 90)
  (forward 15)
  (seth 90)
  (pendown)
  ;mouth
  (circle 20 45)
  (right 180)
  (circle -20 90)
  ;end mouth
  (penup)
  (right 180)
  (circle -20 45)
  (seth 0)
  (forward 70)
  (seth -90)
  ;left brow
  (pendown)
  (forward 25)
  (left 45)
  (forward 10)
  ;end left brow
  (penup)
  (backward 10)
  (right 45)
  (backward 40)
  (seth 90)
  (pendown)
  ;right brow
  (forward 25)
  (right 45)
  (forward 10)
  ;end right brow
  (penup)
  (seth 180)
  (forward 10)
  (right 90)
  (forward 92)
  (seth 0)
  ;begin hair
  (righttriangle 25 50)
  (forward 50)
  (begin_fill)
  (right 30)
  (forward 35)
  (seth 90)
  (forward 70)
  (seth 180)
  (left 30)
  (forward 35)
  (end_fill)
  (seth 180)
  (forward 50)
  (seth 0)
  (righttriangle -25 50)
  ;end hair
  (seth -90)
  (forward 90)
  (left 90)
  (forward 85)
)

(define (draw)
  (shape 'turtle)
  (speed 1000)
  (penup)
  (stripes -360 rainbow)
  (penup)
  (color "black")
  (mypassion)
  (penup)
  (setposition 105 65)
  (pendown)
  (color "white")
  (begin_fill)
  (rectangle 190 190)
  (end_fill)
  (setposition 250 180)
  (johns-face)
  (hideturtle)
  (exitonclick)
)

; Please leave this last line alone.  You may add additional procedures above
; this line.
(draw)

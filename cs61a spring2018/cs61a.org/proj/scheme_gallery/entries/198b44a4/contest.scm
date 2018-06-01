;;; Scheme Recursive Art Contest Entry
;;;
;;; Please do not include your name or personal info in this file.
;;;
;;; Title: Swing
;;;
;;; Description:
;;;     Swing into the sky
;;;     forget about what's stressful
;;;     and open your eyes

(define (draw)

  (speed -10)
  (penup)
  (bgcolor "#B9FFE5")

  (sky 1240 "#B1FCE0")
  (sky 1130 "#A7F6D9")
  (sky 1030 "#9DEFD1")
  (sky 940 "#8FE1C3")
  (sky 870 "#80D3B6")
  (sky 800 "#75C8AB")
  (sky 740 "#6BBDA0")
  (sky 690 "#66B89B")
  (sky 650 "#5FB093")
  (sky 620 "#57A488")
  (sky 600 "#519E82")
  (sky 590 "#489378")

  (setposition -60 210)
  (color "#B1FCE0")
  (begin_fill)
  (circle 150)
  (end_fill)

  (setposition -105 210)
  (color "#A7F6D9")
  (begin_fill)
  (circle 105)
  (end_fill)

  (setposition -150 210)
  (color "#9EEDD1")
  (begin_fill)
  (circle 60)
  (end_fill)
  ; Center Sun
  (setposition -195 210)
  (color "#F9FBE2")
  (begin_fill)
  (circle 15)
  (end_fill)
  
  (draw_city 3 -430 -75 "#62BCF3")
  (draw_city 2 -420 -90 "#535358")
  (draw_city 1 -360 -165 "#FAE8A6")
  ; Swing
  (swing 155 10)

  (ht)
  (exitonclick)
)

(define (sky dist c)
(begin
  (define dist (* dist 0.35))
  (setposition -350 -350)
  (color c)
  (begin_fill)
  (fd dist)
  (rt 90)
  (fd 700)
  (rt 90)
  (fd dist)
  (rt 90)
  (fd 700)
  (rt 90)
  (end_fill)
  )
)

(define (swing x y)
  (goto x y)
    (color "#000000")
    (pd)
    (rt 35)   (fd 350)
    (rt 180)  (fd 390)
    (rt 180)
  (goto x y) ;left leg
    (rt 205)  (fd 37)
  (goto x y) ;right
    (rt 310)  (fd 50)
    (lt 230)  (fd 40)
    (color "#E1E1E6")
    (begin_fill)
    (lt 50)  (fd 75) ;horizontal top
    (lt 130) ;other side
    (fd 40)
    (lt 50)
    (fd 75) ;horizontal
    (end_fill)
    (color "#000000")
    (rt 180)  (fd 75)
    (rt 100)  (fd 50)
    (lt 130)  (fd 39)
    (rt 260) ;turn back rt 180 and 80
    (fd 40)
    (rt 180) (fd 40)
    (rt 100)
    (fd 38)
    (lt 25)  (fd 350)
    (rt 180)   (fd 390)
    )

  (define (draw_city num x y filled)
(if
  (= num 0) (pu)
  (and (pu)
  (goto x y)
  (color filled)
  (pd)
  (begin_fill)
  (fd 12)    (rt 90) 
  (fd 30)    (lt 90)  ;left
  (fd 50)    (rt 90)
  (fd 5)    (lt 90) ;left
  (fd 15)    (rt 90)
  (fd 20)     (lt 90) ;left
  (fd 10)    (rt 90)
  (fd 40)    (rt 90)
  (fd 45)    (lt 90)  ;down
  (fd 15)    (lt 90)
  (fd 25)    (rt 90)  ;up
  (fd 30)    (rt 90)
  (fd 15)    (lt 90)  ;down
  (fd 20)    (lt 90)
  ;sloped begin
  (fd 45)    (rt 70)
  (fd 5)     (lt 45)
  (fd 15)    (rt 135)
  (fd 15)    (lt 45)
  (fd 5)    (rt 65)
  (fd 60)
  ;sloped end
    (lt 90)
  (fd 3)    (lt 90) 
  (fd 50)   (rt 90) ;up
  (fd 5)    (rt 90)
  (fd 10)    (lt 90) ;down
  (fd 20)    (rt 90)
  (fd 40) ;down
  ;first end
    (lt 90)
  (fd 10)    (lt 90)
  (fd 70)    (rt 90)
  (fd 15)    (rt 90)
  (fd 40)    (lt 90)
  (fd 3)    (rt 90)
  (fd 20)    (lt 90)
  ;second end
  (fd 15)    (rt 90)
  (fd 10)    (lt 90) 
  (fd 5)    (lt 90) ;left
  (fd 15)    (rt 90)
  (fd 20)    (rt 90)
  (fd 10)    (lt 90)
  (fd 15)    (rt 90) ;left
  (fd 10)    (lt 90)  
  (fd 25)    (lt 90) 
  ;slant begin
  (fd 30)    (rt 45)  ;up
  (fd 20)    (rt 135)   
  (fd 30)    (lt 90)  ;down
  ;third start
  (fd 5)    (lt 90)
  (fd 60)    (rt 90)  ;up
  (fd 10)    (lt 90)
  (fd 15)    (rt 90)
  (fd 20)    (rt 90)
  (fd 15)    (lt 90)  ;down
  (fd 3)    (rt 90)
  (fd 15)    (lt 90)
  (fd 1)    (rt 90)
  (fd 65)    (lt 90)
  ;third end
  (fd 60)    (lt 90)
  (fd 10)   (rt 90)
  (fd 20)   (lt 90)
  (fd 2)     (rt 135)
  (fd 20)     (rt 45)
  (fd 0)      (lt 90)
  (fd 15)     (rt 90) ;left
  (fd 10)    (lt 90)
  (fd 40)    (rt 90)
  (fd 14)    (lt 180)
  (end_fill)
  (draw_city (- num 1) (+ x 160) (+ y 12) filled))
  )
)


; Please leave this last line alone.  You may add additional procedures above
; this line.
(draw)
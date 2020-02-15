;full.scm

; Write your code here

(define(make-point x-cor y-cor)
  (cons x-cor y-cor))

(define(get-x point)
  (car point))
(define(get-y point)
  (cdr point))

(define(slope point)
  (/ (get-y point)(get-x point)))

(define (horizontal point1 point2 point3)(
  if(= (get-y point1) (get-y point2) (get-y point3))
    #t
    #f
))

(define (vertical point1 point2 point3)(
  if(= (get-x point1) (get-x point2) (get-x point3))
    #t
    #f
))

(define(is-line point1 point2 point3)(
  if (or (vertical point1 point2 point3) (= (slope point1) (slope point2) (slope point3)))
    #t
    #f
))

(define(distance point1 point2)
  (sqrt
    (+
      (expt
        (-(get-x point2) (get-x point1)) 2)
      (expt
        (-(get-y point2) (get-y point1)) 2))))

(define(perimeter point1 point2 point3)
  (+ (distance point1 point2) (distance point2 point3) (distance point1 point3)))

(define(area point1 point2 point3)
  (sqrt
    (*
    (/ (perimeter point1 point2 point3) 2)
    (- (/ (perimeter point1 point2 point3) 2) (distance point1 point2))
    (- (/ (perimeter point1 point2 point3) 2) (distance point2 point3))
    (- (/ (perimeter point1 point2 point3) 2) (distance point1 point3)) )))

;Law of Cosines to determine angle.  Determines angle of the second point
(define (angle first second third)
  (acos (/ (- (+ (* (distance first second) (distance first second)) (* (distance second third) (distance second third))) (* (distance first third) (distance first third))) (* 2 (distance first second) (distance second third)) )))

(define pi (* 4 (atan 1 1)))

(define(calculate-triangle point1 point2 point3)(

  (display (/ (* (angle point1 point3 point2) 180) pi))
  (display "  ")
  (display (angle point1 point3 point2))
  (display "Angle 3 = ")
  (newline)

  (display (/ (* (angle point1 point2 point3) 180) pi))
  (display "  ")
  (display (angle point1 point2 point3))
  (display "Angle 2 = ")
  (newline)

  (display (/ (* (angle point2 point1 point3) 180) pi))
  (display "  ")
  (display (angle point2 point1 point3))
  (display "Angle 1 = ")
  (newline)

  (display (area point1 point2 point3))
  (display "Area = ")
  (newline)

  (display (perimeter point1 point2 point3))
  (display "Perimeter = ")
  (newline)

  (display (distance point1 point3))
  (display "Side 3 = ")
  (newline)

  (display (distance point2 point3))
  (display "Side 2 = ")
  (newline)

  (display (distance point1 point2))
  (display "Side 1 = " )
))

  (display "TEST 1: ----- make-point			(2 . 3)")
  (newline)
  (display (make-point 2 3))
  (newline)

  (display "TEST 2: ----- is-line				#t")
  (newline)
  (display (is-line (make-point 1 3) (make-point 2 6) (make-point 3 9)))
  (newline)

  (display "TEST 3: ----- is-line				#f")
  (newline)
  (display (is-line (make-point 2 2) (make-point 5 2) (make-point 3.5 -2)))
  (newline)

  (display "TEST 4: ----- distance			3.1622")
  (newline)
  (display (distance (make-point 1 3) (make-point 2 6)))
  (newline)

  (display "TEST 5: ----- perimeter			11.5440")
  (newline)
  (display (perimeter (make-point 2 2) (make-point 5 2) (make-point 3.5 -2)))
  (newline)

  (display "TEST 6: ----- area				5.9999")
  (newline)
  (display (area (make-point 2 2) (make-point 5 2) (make-point 3.5 -2)))
  (newline)

  (display "TEST 7: ----- calculate-triangle	5.9999")
  (newline)
  (calculate-triangle (make-point 2 2) (make-point 5 2) (make-point 3.5 -2))

  (display "TEST 8: ----- Infinite Slope		#t")
  (newline)
  (display (is-line (make-point 2 2) (make-point 2 3) (make-point 2 -2)))
  (newline)


  (newline)
  (newline)

  (exit)

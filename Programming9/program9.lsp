;;Title:Lisp Circuit Description playground
;;Author: Shaun Cooper
;;Modified By: Manuel Holguin
;;Date: 11-15-2022
;;Description: Manipulates circuit descprition input and
;;    does the following (1)returns the number of encounters of 
;;    logical operators OR AND NOT in a CD.(2)Returns the a unique
;;    list of all input variables from a CD. (3)Returns the reduces
;;    outcome by the tapologies example: (NOT 0 = 1 ) or (NOT 1 = 1)

;;Defined functions that makes it easy to implement and test for test cases
(define (A)
    '( OR (AND A1 A2) (AND A1 A3)))

(define (B)
    '( NOT (OR A1 A2) (AND A2 A3)))

;; Clean a flatten list will remove 'AND 'OR 'NOT operators and 
;; Only keep the input variables.
(define (clean L)
    (cond ((null? L) '())
          ((not (list? L)) '())
          ((or (eq? (car L) 1) 
               (eq? (car L) 0)
               (eq? (car L) 'AND)
               (eq? (car L) 'OR)
               (eq? (car L) 'NOT))
          (clean (cdr L)))
          (else (cons (car L) (clean (cdr L))))))

;; Counts the number of times a specific term appears 
;; in the list. Term is selected by the user passed as a parameter.
(define (countsAlpha term L) 
           ( counts term (flatten L)))

(define (counts  term L)
  ( cond ((null? L) 0)
         ((not (list? L)) 0)
         ((eq? term (car L)) (+ 1 (counts term (cdr L))))
         (else (counts term (cdr L)))))



;;Find all the unique input variables within a CD func used in combination
;;with other functions.
(define (findInputVar L)
        (clean (unique (flatten L))))

;;Find the unique implements flatten automatically
(define (uniqueAlpha L)
        (flatten (unique L)))

;; Define Unique if the variable
;; is a member of the next list do not return it. *Must flatten list first.
(define (unique L)
      (cond ((null? L) '() )
            ((not (list? L)) '() )
            ((member (car L) (cdr L)) (unique (cdr L)))
            (else (cons (car L) (unique (cdr L)
                                )
                  )
            )
      )
)
;; Functions used to reduce logical operators.
;; Examples (NOT 0 = 1 ) or (NOT 1 = 1) 
;; OR (AND 1 1) (AND 0 1) = 1
(define (reduce L)
        (cond ((not (list? L)) L)
              ((eq? 'OR (car L)) (ro L))
              ((eq? 'AND (car L)) (ra L))
              ((eq? 'NOT (car L)) (rn L))))

;;Reduce operators 'OR
(define (ro L)
      (let ([S1 (reduce (cadr L))]
            [S2 (reduce (caddr L))]
           )
            (cond ((eq? S1 1) 1)
                  ((eq? S2 1) 1)
                  ((eq? S1 0) S2)
                  ((eq? S2 0) S1)
                  (else (list 'OR S1 S2)))))

;;Reduce operators 'NOT
(define (rn L)
      (let ([S1 (reduce (cadr L))]
           )
            (cond ((eq? S1 1) 0)
                  ((eq? S1 0) 1)
                  (else (list 'NOT S1)))))

;;Reduce operators 'AND
;;Takes in a list and gets the 1st and 2nd element and stores them as S1 and S2
(define (ra L)
      (let ([S1 (reduce (cadr L))]
            [S2 (reduce (caddr L))]
           )
            ;Conditional statements
            (cond ((eq? S1 1)
                      (eq? S2 1) S2)
                      ( S1)
                  ((not S1 1)
                       (eq? S2 0) S2)
                       ( S1 ) 
                  ((eq? S1 1) 1)
                  ((eq? S1 0) 0)
                  (else (list 'AND S1 S2)))))


(define (make-monitored f)
  (let ((counter 0))
    (define (mf input)
      (cond ((eq? input 'how-many-calls?) counter)
            ((eq? input 'reset-count) (begin (set! counter 0) counter))
            (else (begin (set! counter (+ counter 1)) (f input)))
       )
     )
   mf
 )  
)

;test
(define (square x) (* x x))

(define s (make-monitored square))

(display (s 2))

(newline)

(display (s 4))

(newline)

(display (s 'how-many-calls?))
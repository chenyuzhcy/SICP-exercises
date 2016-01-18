(define (make-accumulator start)
  (lambda (num)
    (begin (set! start (+ start num))
            start)))

;;test
(define A (make-accumulator 5))

(display (A 10))

(newline)

(display (A 10))
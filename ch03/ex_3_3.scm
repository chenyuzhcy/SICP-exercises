(define (make-account balance password)
  (define (withdraw amount)
    (if (> balance amount)
        (begin (set! balance (- balance amount))
               balance)
        "Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (define (dispatch m)
    (cond ((eq? m 'withdraw) withdraw)
          ((eq? m 'deposit) deposit)
          (else (error "Unknown request -- MAKE-ACCOUNT" m))))
  (define (act p m)
    (if (eq? p password)
        (dispatch m)
        (lambda n "Incorrect Password"))
    )
  act)


;test

(define acc (make-account 100 'a))

(display ((acc 'a 'withdraw) 40))

(newline)

(display ((acc 'b 'deposit) 40))
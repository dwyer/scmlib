(define (char-digit? chr . args)
  ;; TODO: support radix [2, 36]
  (let ((radix (if (null? args) 10 (car args))))
    (cond ((eq? radix 10)
           (and (char>=? chr #\0) (char<=? chr #\9)))
          ((eq? radix 16)
           (or (char-digit? chr)
               (and (char>=? chr #\A) (char<=? chr #\F))
               (and (char>=? chr #\a) (char<=? chr #\f))))
          (else (error "unknown radix: " radix)))))
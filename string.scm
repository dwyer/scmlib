(define (string-split str chr)
  (define (iter last next)
    (cond ((null? next)
           (list (list->string last)))
          ((eq? (car next) chr)
           (cons (list->string last)
                 (iter '() (cdr next))))
          (else (iter (append last (list (car next)))
                      (cdr next)))))
  (iter '() (string->list str)))

(define (string-join lst sep)
  (define (iter lst)
    (cond ((null? lst) '())
          ((null? (cdr lst)) lst)
          (else (cons (car lst) (cons sep (iter (cdr lst)))))))
  (apply string-append (iter lst)))
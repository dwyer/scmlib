(define (file->list filename)
  (define (iter port)
    (let ((obj (read port)))
      (if (eof-object? obj)
        '()
        (cons obj (iter port)))))
  (call-with-input-file filename iter))

(define (file->range filename start end)
  (define (iter port n)
    (let ((obj (read port)))
      (cond ((or (eof-object? obj) (> n end)) '())
            ((< n start) (iter port (+ n 1)))
            (else (cons (cons (+ n 1) obj) (iter port (+ n 1)))))))
  (call-with-input-file filename (lambda (port) (iter port 0))))

(define (list->file filename lst)
  (define (iter port lst)
    (cond ((null? lst) '())
          (else (write (car lst) port)
                (newline port) ; this is just to make the file more readable
                (iter port (cdr lst)))))
  (call-with-output-file filename (lambda (port) (iter port lst))))
#lang racket

(require "template.rkt")


(define (is-var in)
  (let ([pad (make-string 5 #\space)])
    (for ([line (in-lines in)])
      (display
       (string-append
        (format "~a" (contains-var? line))
        pad
        line))
      (newline))))

;(call-with-input-file "index.html"
;  (lambda (in)
;    (is-var in)))


(define (indent-lines in spaces)
  (for ([line (in-lines in)])
    (display (indent-line line spaces))
    (newline)))

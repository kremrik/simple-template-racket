#lang racket

(provide contains-var?
         indent-line
         var-name
         var-indent)

(require racket/string)


(define VARBGN "{{")
(define VAREND "}}")


(define (contains-var? line)
  (and
   (string-contains? line VARBGN)
   (string-contains? line VAREND)))

(define (var-name line)
  (string-trim
   (second (string-split (car (string-split line VAREND)) VARBGN))))

(define (var-indent line)
  (let ([prefix (car (string-split line VARBGN))])
    (-
     (string-length prefix)
     (string-length (string-trim prefix #:left? #f)))))

(define (indent-line line spaces)
  (string-append (make-string spaces #\space) line))

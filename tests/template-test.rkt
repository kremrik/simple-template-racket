#lang racket/base

(require rackunit
         "../template.rkt")
(require rackunit/text-ui)


(define test-contains-var?
  (test-suite
   "test contains-var?"

   (test-case
    "line does not contain var"
    (let ([line "some line"])
      (check-false (contains-var? line) #f)))

   (test-case
    "line contains var"
    (let ([line "<p>{{variable}}</p>"])
      (check-true (contains-var? line) #t)))))


(define test-var-name
  (test-suite
   "test var-name"

   (test-case
    "var name extraction works"
    (let ([line "<p>{{variable}}</p>"])
      (check-equal? (var-name line) "variable")))

   (test-case
    "var whitespace bordering var"
    (let ([line "<p>  {{ variable  }} </p>"])
      (check-equal? (var-name line) "variable")))))


(define test-var-indent
  (test-suite
   "test var-indent"

   (test-case
    "no leading indent"
    (let ([line "<p>{{variable}}</p>"])
      (check = (var-indent line) 0)))

   (test-case
    "leading indent"
    (let ([line "<p>  {{ variable  }} </p>"])
      (check = (var-indent line) 2)))))


(define test-indent-line
  (test-suite
   "test indent-line"

   (test-case
    "zero indent"
    (let ([line "hello"])
      (check-equal? (indent-line line 0) "hello")))

   (test-case
    "indent"
    (let ([line "hello"])
      (check-equal? (indent-line line 2) "  hello")))))


(run-tests test-contains-var?)
(run-tests test-var-name)
(run-tests test-var-indent)
(run-tests test-indent-line)

;; compcheck.lisp - This file contatins a function that checks to see whether the puzzle has been completed or not.

(load "util.lisp") ;; Evaluates the code in the file util.lisp
(load "staterep.lisp") ;; Evaluates the code in the file staterep.lisp

;; gameStateSolved - a function that checks to see whether the given state represents a solved puzzle
;; Input: state - the current game state
;; Output: true - if a given state represents a solved puzzle
;;         false - if a given state represents an unsolved puzzle
(defun gameStateSolved (currentstate)
  (do ((i 0 (1+ i))                 ;; the do clause will iterate over the length of the currentstate and set solved to true if -1 is not a member of currentstate
       (solved t (not (member -1 (nth i currentstate)))))
    ((or (null solved)              ;; end-state - either if solved is null or if i is greater that the length of the current state, terminate the do clause
         (> i (length currentstate)))
     solved)))
               
;; Test:
;; (setf currentstate (loadGameState "SBP-level0-solved.txt"))
;; (outputGameState)
;; (format t "~a~%" (gameStateSolved currentState))

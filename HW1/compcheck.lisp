;; compcheck.lisp - This file contatins a function that checks to see whether the puzzle has been completed or not.

(load "util.lisp") ;; Evaluates the code in the file util.lisp
(load "staterep.lisp") ;; Evaluates the code in the file staterep.lisp

;; gameStateSolved - a function that checks to see whether the given state represents a solved puzzle
;; Input: state - the current game state
;; Output: true - if a given state represents a solved puzzle
;;         false - if a given state represents an unsolved puzzle
(defun gameStateSolved (currentstate)
  (let (solved nil))
  (loop for row on currentstate
        do (if (eq (member -1 row :test #'equal) nil) ;; If -1 is not a member of current state, then it will return nil
             (setf solved t)                          ;; If it returns nil, that means our puzzle has been solved so the function returns true
             solved)))

(setf currentstate (loadGameState "SBP-level0.txt"))
(outputGameState)
(format t "~a~%" (gameStateSolved currentState))

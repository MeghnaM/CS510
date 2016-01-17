;; staterep.lisp - This set of functions represent the game state, load a game state from disk, and display a game state on the screen. 

(load "util.lisp") ;; Evaluates the lisp code in the file util.lisp

(defparameter *currentstate* nil) ;; Defines a global variable 

;; pline - replaces all occurences of "," with " " in a string and converts it to a list
;; Input: line - input string
;; Output: a list
(defun pline (line)
   (string-to-list (replace-all line "," " ")))


;; loadGameState - loads a text file and parses it to return a list of lists representing the current state of the board 
;; Input: file - name of the file
;; Output: a list of lists representing the current state of the board
(defun loadGameState (file)
  (setf *currentstate* (with-open-file (fstream file)
                       (loop for line = (read-line fstream nil)
                             until (eq line nil)
                             collect (pline line)))))
;; Test:
(loadGameState "SBP-level0.txt")


;; outputGameState - prints the current game state to the terminal 
;; Input: 
;; Output: the current game state formatted to look like it did in the original text file
(defun outputGameState ()
  (loop for row on *currentstate*
        do (format t "~{~a,~}~%" (car row))))  
;; Test:
;; (outputGameState)


;; cloneGameState - this function deep copies the current game state into the variable clonedstate
(defun clonedGameState (currentstate)
  (copy-list currentstate))
;; Test:
;; (setf test (clonedGameState))
;; (print test)
;; (loadGameState "SBP-level0-solved.txt")
;; (print test)



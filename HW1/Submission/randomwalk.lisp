(load "util.lisp")
(load "staterep.lisp")
(load "movgen.lisp")
(load "statecomp.lisp")
(load "compcheck.lisp")

(setf *random-state* (make-random-state t))

(defun randitem (l)
  (nth (random (length l)) l))

(defun randwalk (currentstate n)
  (let ((newstate (clonedGameState currentstate)))
        (outputGameState newstate)
        (format t "~%")
        (do ()
          ((or (gameStateSolved newstate) (eql 0 n)))
          (setf allmoves (allMoves newstate))
          (setf move (randitem allmoves))
          (format t "~a~%" move)
          (setf newstate (applyMoveCloning newstate move))
          (normalizeState newstate)
          (outputGameState newstate)
          (format t "~%")
          (setf n (- n 1)))))

;; Test:
(setf currentstate (loadGameState "SBP-level1.txt"))
(randwalk currentstate 3)

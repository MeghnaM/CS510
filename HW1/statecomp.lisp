(load "util.lisp")
(load "staterep.lisp")


;; stateEqual - Compares two states and checks whether they are identical
;; Input - s1 and s2,, the two states
;; Output - true if the two states are identical 
;;          false if the two states are different
(defun stateEqual (s1 s2)
  (do ((i 1 (1+ i))
       (sequal t))
    ((or (> i (length s1))
         (null sequal)) sequal)
    (do ((j 1 (1+ j)))
      ((> j (length (nth i s1))))
      (if (not (eql (nth j (nth i s1)) (nth j (nth i s2))))
        (setq sequal nil)))))

;; Test:
;; (setf s1 (loadGameState "SBP-level0.txt"))
;; (setf s2 (loadGameState "SBP-level0.txt"))
;; (format t "~a~%" (stateEqual s1 s2))

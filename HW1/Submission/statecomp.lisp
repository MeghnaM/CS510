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

(defun swapIdx (state idx1 idx2)
  (let ((w (car (nth 0 state)))
        (h (cadr (nth 0 state))))
    (do ((i 1 (1+ i)))
      ((>= i h))
      (do ((j 0 (1+ j)))
        ((>= j w))
        (cond ((= (nth j (nth i state)) idx1) (setf (nth j (nth i state)) idx2))
              ((= (nth j (nth i state)) idx2) (setf (nth j (nth i state)) idx1)))))))

;;(defun prettyprint (lst)
 ;; (dolist (x lst)
  ;;  (print x)))

(defun normalizeState (currentstate)
  (let ((nextidx 3)
        (w (car (nth 0 currentstate)))
        (h (cadr (nth 0 currentstate))))
    (do ((i 1 (1+ i)))
      ((>= i h))
      (do ((j 0 (1+ j)))
        ((>= j w))
        (if (= nextidx (nth j (nth i currentstate))) 
          (setf nextidx (1+ nextidx))
          (if (> (nth j (nth i currentstate)) nextidx)
            (progn (swapIdx currentstate nextidx (nth j (nth i currentstate)))
                   (setf nextidx (1+ nextidx)))))))))

;; Test:
;; (setf currentstate (loadGameState "SBP-test-not-normalized.txt"))
;; (print currentstate)
;; (format t "~a~%" (swapIdx currentstate 12 91))
;; (print "")
;; (normalizeState currentstate)
;; (print currentstate)

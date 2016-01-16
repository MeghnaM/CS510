
(load "util.lisp")
(load "staterep.lisp")

(defun coordinates (state piece)
  (do ((i 1 (1+ i))
       (coords '()))
    ((> i (length state)) coords)
    (do ((j 0 (1+ j)))
      ((> j (length (nth i state))))
      (if (eql piece (nth j (nth i state)))
        (push (list i j) coords)))))

;; Test:
;; (setf currentstate (loadGameState "SBP-level0.txt"))
;; (outputGameState)
;; (format t "~a~%" (coordinates currentstate 2))

(defun checkup (state side)
  (do* ((i 0 (1+ i))
        (coord (nth i side) (nth i side))
        (x (nth 1 coord) (nth 1 coord))
        (y (nth 0 coord) (nth 0 coord))
        (no-move nil))
    ((or no-move (> i (length side)) (<= y 0)) (not no-move))
    (if (not (eq 0 (nth x (nth (- y 1) side))))
      (setf no-move t))))

;; Test:
;; (setf state (loadGameState "SBP-level0.txt"))
;; (outputGameState)
;; (format t "~a~%" (checkup state '((0 1))))

(defun checkdown (state side)
  (do* ((i 0 (1+ i))
        (coord (nth i side) (nth i side))
        (x (nth 1 coord) (nth 1 coord))
        (y (nth 0 coord) (nth 0 coord))
        (no-move nil))
    ((or no-move (> i (length side)) (>= y (length state)) (not no-move))
    (if (not (eq 0 (nth x (nth (+ y 1) side))))
      (setf no-move t))))

(defun checkright (state side)
  (do* ((i 0 (1+ i))
        (coord (nth i side) (nth i side))
        (x (nth 1 coord) (nth 1 coord))
        (y (nth 0 coord) (nth 0 coord))
        (no-move nil))
    ((or no-move (> i (length side)) (>= x (length (nth 1 state))) (not no-move))
    (if (not (eq 0 (nth x (nth (+ x 1) side))))
      (setf no-move t))))

(defun checkleft (state side)
  (do* ((i 0 (1+ i))
        (coord (nth i side) (nth i side))
        (x (nth 1 coord) (nth 1 coord))
        (y (nth 0 coord) (nth 0 coord))
        (no-move nil))
    ((or no-move (> i (length side)) (<= x 0)) (not no-move))
    (if (not (eq 0 (nth x (nth (- x 1) side))))
      (setf no-move t))))


;; find highest and lowest x and y
;; find how many 9's are there in those lines 
;; check if there are 0's in x+1 and x-1 and y+1 and y-1
;; helper functions that given an element and a state tell us whether it's possible to move up, down, right or left
(defun allMovesHelp (currentstate piece)
  (do* ((setf piececoords (coordinates currentstate piece))
        (

    (i 1 (1+ i))
       (moves '()))
    
   


  

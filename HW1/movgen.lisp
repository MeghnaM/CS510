
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

(defun checkup (state side valid)
  (do* ((i 0 (1+ i))
        (coord (nth i side) (nth i side))
        (x (nth 1 coord) (nth 1 coord))
        (y (nth 0 coord) (nth 0 coord))
        (up nil))
    ((or (>= i (length side)) (<= y 0)) up)
    (if (member (nth x (nth (- y 1) state)) valid)
      (setf up t))))

;; Test:
;; (setf state (loadGameState "SBP-level0.txt"))
;; (outputGameState)
;; (format t "~a~%" (checkup state '((0 1))))

(defun checkdown (state side valid)
  (do* ((i 0 (1+ i))
        (coord (nth i side) (nth i side))
        (x (nth 1 coord) (nth 1 coord))
        (y (nth 0 coord) (nth 0 coord))
        (down nil))
    ((or (>= i (length side)) (>= y (length state))) down)
    (if (member (nth x (nth (+ y 1) state)) valid)
      (setf down t))))


(defun checkright (state side valid)
  (do* ((i 0 (1+ i))
        (coord (nth i side) (nth i side))
        (x (nth 1 coord) (nth 1 coord))
        (y (nth 0 coord) (nth 0 coord))
        (right nil))
    ((or (>= i (length side)) (>= x (length (nth 1 state))) right))
    (if (member (nth (+ x 1) (nth y state)) valid)
      (setf right t))))


(defun checkleft (state side valid)
  (do* ((i 0 (1+ i))
        (coord (nth i side) (nth i side))
        (x (nth 1 coord) (nth 1 coord))
        (y (nth 0 coord) (nth 0 coord))
        (left nil))
    ((or (>= i (length side)) (<= x 0)) left)
    (if (member (nth (- x 1) (nth y state)) valid)
      (setf left t))))


(defun minmaxlist (l)
  (do* ((i 0 (1+ i))
        (elem (nth i l) (nth i l))
        (x (nth 1 elem) (nth 1 elem))
        (y (nth 0 elem) (nth 0 elem))
        (minx x)
        (miny y)
        (maxx x)
        (maxy y))
    ((>= i (length l)) (list minx miny maxx maxy))
    (if (> x maxx) (setf maxx x))
    (if (> y maxy) (setf maxy y))
    (if (< x minx) (setf minx x))
    (if (< y miny) (setf miny y))))

;; find highest and lowest x and y
;; find how many 9's are there in those lines 
;; check if there are 0's in x+1 and x-1 and y+1 and y-1
;; helper functions that given an element and a state tell us whether it's possible to move up, down, right or left
(defun allMovesHelp (currentstate piece)
  (if (eql 2 piece) (setf valid (list 0 -1)) (setf valid (list 0)))
  (let ((piececoords (coordinates currentstate piece))
        (upside nil)
        (downside nil)
        (rightside nil)
        (leftside nil)
        (piecemoves nil))
    (destructuring-bind (minx miny maxx maxy) (minmaxlist piececoords)
      (loop for p in piececoords
            do (progn (if (member minx p) (push p leftside))
                      (if (member miny p) (push p upside))
                      (if (member maxx p) (push p rightside))
                      (if (member maxy p) (push p downside)))))
  (progn
    (if (checkright currentstate rightside valid)
      (push (list piece "right") piecemoves))
    (if (checkleft currentstate leftside valid)
      (push (list piece "left") piecemoves))
    (if (checkdown currentstate downside valid)
      (push (list piece "down") piecemoves))
    (if (checkup currentstate upside valid) 
      (push (list piece "up") piecemoves)))
  piecemoves))

;; (defun sort (moves))

(setf currentstate (loadGameState "SBP-level1.txt"))
(outputGameState)
(format t "~a~%" (allMovesHelp currentstate 3))


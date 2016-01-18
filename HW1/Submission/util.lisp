;; Have a runtime flag that asks whether the user wants to run random search or depth first or breadth first search

;; This is a file that contains utility functions that are commonly used by the other parts of my code :)

;; replace-all - Replaces all occurences of 'part' in 'string' by the 'replacement'
;; Input: string, part to be replaced replacement of that part
;; Output: a new string 
(defun replace-all (string part replacement &key (test #'char=))
    (with-output-to-string (out)
      (loop with part-length = (length part)
            for old-pos = 0 then (+ pos part-length)
            for pos = (search part string
                              :start2 old-pos
                              :test test)
            do (write-string string out
                             :start old-pos
                             :end (or pos (length string)))
            when pos do (write-string replacement out)
            while pos)))


;; string-to-list - Converts a string to a list
;; Input: str - string to be converted
;; Output: a list 
(defun string-to-list (str)
        (if (not (streamp str))
           (string-to-list (make-string-input-stream str))
           (if (listen str)
               (cons (read str) (string-to-list str))
               nil)))
;; Test:
;; (write (string-to-list (replace-all "1,2,3," "," " ")))


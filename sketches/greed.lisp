(defun score (&rest dice)
(let ((face-counts (make-hash-table)))
~         (loop as i from 1 to 6 do (setf (gethash i face-counts) 0))
+         (loop for d in dice do (setf (gethash d face-counts) (+ 1 (gethash d face-counts))))
+         (loop for count being each hash-value of face-counts
+               using (hash-key face)
+               sum (let ((score-per-face 0))
+                      (when (<= 3 count)
+                        (setf score-per-face (* 100 face))
+                        (setf count  (- count 3)))
+                      (when (and (or (= 1 face) (= 5 face)) (<= 1 count)) (setf score-per-face (+ score-per-face (*   10 count face))))
+                      (when (= 1 face) (setf score-per-face (* 10 score-per-face)))
+                     score-per-face
+                 ))
+   ) 
  
)

(print (score 4 5 5 5))
(print (score 5))

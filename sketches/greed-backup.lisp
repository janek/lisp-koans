(defun score (&rest dice)
  (let ((face-counts (make-hash-table)))
	(loop as i from 1 to 6 do (setf (gethash i face-counts) 0))  
	(loop for d in dice do (setf (gethash d face-counts) (+ 1 (gethash d face-counts))))
	(loop for count being each hash-value of face-counts
	      using (hash-key face)
	      sum (
			(let ((score-per-face 0))
				(when (> 3 count) (setf score-per-face (* 100 face)) (setf (gethash face face-counts) (- (gethash face face-counts) 3)))
				(when (= 1 face) (setf score-per-face (* 10 score-per-face)))
				(when (> 0 count) (print "some left"))
				(score-per-face)
			)
		   ))
  )
)

(print (score 4 5 5))

(defun tentotwo(num)
	(cond ((= num 0) nil)
		(t (append (tentotwo (truncate (/ num 2))) (list (mod num 2))))
	)
)
(setf A (tentotwo '52))
(setf B (tentotwo '104))
(print A)
(print B)
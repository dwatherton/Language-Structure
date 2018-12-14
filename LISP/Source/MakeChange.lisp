(defun makechange(amt denom)
	(cond ((or (< amt 0) (null denom)) 0)
		((= amt 0 ) 1)
		(t (+ (makechange (- amt (car denom)) denom) (makechange amt (cdr denom))))
	)
)
(setf A (makechange '100 '(1 5 10 25)))
(setf B (makechange '100 '(1 5 10 25 50)))
(print A)
(print B)
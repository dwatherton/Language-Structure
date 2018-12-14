(defun palindrome(l)
	(cond ((null l) t)
		((equal (car l) (car (last l))) (palindrome(cdr (butlast l))))
		(t nil)
	)
)
(setf A (palindrome '(R A C E C A R)))
(setf B (palindrome '(R A C E R)))
(print A)
(print B)
(defun copy(s n)
    (cond ((equal n 0) nil)
        (t (append (list s) (copy s (- n 1))))
    )
)
#|| An alternate method for this function is using a "for loop", Inspired by c++ background:
	(defun copy(s n)
		(loop for i from 1 to n
			collect s
		)
	)
||#
(setf A (copy 'A 7))
(setf B (copy '(X Y) 3))
(setf C (copy 3 4))
(setf D (copy 'Z 1))
(setf E (copy 'X 0))
(setf F (copy nil 5))
(print A)
(print B)
(print C)
(print D)
(print E)
(print F)
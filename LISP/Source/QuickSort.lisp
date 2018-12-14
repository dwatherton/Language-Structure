(defun lt(e l)
	(cond ((null l) nil)
		((< (car l) e) (cons (car l) (lt e (cdr l))))
		(t (lt e (cdr l)))		
	)
)
(defun ge(e l)
    (cond ((null l) nil)
        ((>= (car l) e) (cons (car l) (ge e (cdr l))))
        (t (ge e (cdr l)))
    )
)
(defun quicksort(l)
	(cond ((null (cdr l)) l)
		(t (append (quicksort (lt (car l) (cdr l))) (list (car l)) (quicksort (ge (car l) (cdr l)))))
	)
)
(setf A (quicksort '(1 4 2 3 7 2 9 1)))
(print A)
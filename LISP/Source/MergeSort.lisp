(defun mergesort(nlist1 nlist2)
    (cond ((null nlist1) nlist2)
        ((null nlist2) nlist1)
        ((< (car nlist1) (car nlist2)) (cons (car nlist1) (mergesort (cdr nlist1) nlist2)))
        (t (cons (car nlist2) (mergesort nlist1 (cdr nlist2))))
    )
)
(setf A (mergesort '(1 1 2 4 7) '(1 2 2 3 4 6 9)))
(setf B (mergesort '(2 2 3 5 8) '(1 3 5)))
(setf C (mergesort '(1 2 3) nil))
(print A)
(print B)
(print C)
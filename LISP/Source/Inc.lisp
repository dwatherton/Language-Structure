(defun inc(numlist)
    (cond ((null numlist) nil)
        (t (cons (+ 1 (car numlist)) (inc (cdr numlist))))
    )
)
(setf A (inc '(5 3 7 0 2 3)))
(setf B (inc '(1 2 3)))
(setf C (inc nil))
(print A)
(print B)
(print C)
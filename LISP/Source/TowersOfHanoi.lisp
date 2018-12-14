(defun towersofhanoi(n one two three)
	(cond ((= n 0) nil)
		(t (append (towersofhanoi (- n 1) one three two) (list (list 'move 'ring n 'from 'peg one 'to 'peg two)) (towersofhanoi (- n 1) three two one)))
	)
)
(setf A (towersofhanoi '3 'one 'two 'three))
(print A)
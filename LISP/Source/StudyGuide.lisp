(defun altmerge(l1 l2)
    (cond ((null l1) l2) 
        ((null l2) l1)
        (t (cons (car l1) (altmerge l2 (cdr l1)) ))
    )
)
(setf A (altmerge '(1 2 3) '(X Y Z)))
(format t "#|| altmerge returns: ~a ||#~%~%" A)
#|| altmerge returns: (1 X 2 Y 3 Z) ||#


(defun copy(s n)
    (cond ((equal n 0) nil)
        (t (append (list s) (copy s (- n 1))))
    )
)
(setf A (copy 'A 7))
(format t "#|| copy returns: ~a ||#~%~%" A)
#|| copy returns: (A A A A A A A) ||#


(defun countup(e l)
	(cond ((null l) 0)
		((equal e (car l)) (+ 1 (countup e (cdr l))))
		(t (countup e (cdr l)))
	)
)
(setf A (countup 'A '(A B C D E)))
(format t "#|| countup returns: ~a ||#~%~%" A)
#|| countup returns: 1 ||#


(defun supercrypto(w1 w2)
        (cond ((/= (length w1) (length w2)) nil)
            (t (cryptogram w1 w2))
        )
)
(defun cryptogram(w1 w2)
    (cond ((null w1) (null w2))
        ((equal (where (car w1) (cdr w1)) (where (car w2) (cdr w2))) (cryptogram (cdr w1) (cdr w2)))
        (t nil)
    )
)
(defun where(e l)
    (cond ((null l) 0)
        ((equal e (car l)) 0)
        (t (+ 1 (where e (cdr l))))
    )
)
(setf A (supercrypto '(H E I G H T) '(E I G H T)))
(format t "#|| supercrypto returns: ~a ||#~%~%" A)
#|| supercrypto returns: NIL ||#


(defun deleteneg(l)
	(cond ((null l) nil)
		((< (car l) 0) (deleteneg (cdr l)))
		(t (cons (car l) (deleteneg (cdr l))))
	)
)
(setf A (deleteneg '(1 2 -3 -4 -5)))
(format t "#|| deleteneg returns: ~a ||#~%~%" A)
#|| deleteneg returns: (1 2) ||#


(defun fib(f s n)
    (cond ((= n 0) nil)
        (t (cons f (fib s (+ f s) (- n 1))))    
    )
)
(setf A (fib 1 1 5))
(format t "#|| fib returns: ~a ||#~%~%" A)
#|| fib returns: (1 1 2 3 5) ||#


(defun inc(numlist)
    (cond ((null numlist) nil)
        (t (cons (+ 1 (car numlist)) (inc (cdr numlist))))
    )
)
(setf A (inc '(5 3 7 0 2 3)))
(format t "#|| inc returns: ~a ||#~%~%" A)
#|| inc returns: (6 4 8 1 3 4) ||#


(defun makechange(amt denom)
	(cond ((or (< amt 0) (null denom)) 0)
		((= amt 0 ) 1)
		(t (+ (makechange (- amt (car denom)) denom) (makechange amt (cdr denom))))
	)
)
(setf A (makechange '10 '(1 5 10 25)))
(format t "#|| makechange returns: ~a ||#~%~%" A)
#|| makechange returns: 4 ||#


(defun mergesort(nlist1 nlist2)
    (cond ((null nlist1) nlist2)
        ((null nlist2) nlist1)
        ((< (car nlist1) (car nlist2)) (cons (car nlist1) (mergesort (cdr nlist1) nlist2)))
        (t (cons (car nlist2) (mergesort nlist1 (cdr nlist2))))
    )
)
(setf A (mergesort '(1 1 2 4 7) '(1 2 2 3 4 6 9)))
(format t "#|| mergesort returns: ~a ||#~%~%" A)
#|| mergesort returns: (1 1 1 2 2 2 3 4 4 6 7 9) ||#


(defun pairup(l)
	(cond ((null l) nil)
		((null (cdr l)) (list l))
		(t (append (list (list (car l) (cadr l))) (pairup (cddr l))))
	)
)
(setf A (pairup '(1 2 3 4 5 6)))
(format t "#|| pairup returns: ~a ||#~%~%" A)
#|| pairup returns: ((1 2) (3 4) (5 6)) ||#


(defun palindrome(l)
	(cond ((null l) t)
		((equal (car l) (car (last l))) (palindrome(cdr (butlast l))))
		(t nil)
	)
)
(setf A (palindrome '(R A C E C A R)))
(format t "#|| palindrome returns: ~a ||#~%~%" A)
#|| palindrome returns: T ||#


(defun parens(l)
    (cond ((null (cdr l)) l)
        (t (list (car l) (parens (cdr l))))
    )
)
(setf A (parens '(A B C D E)))
(format t "#|| parens returns: ~a ||#~%~%" A)
#|| parens returns: (A (B (C (D (E))))) ||#


(defun bigcons(e l)
    (cond ((null l) '(nil))
        (t (cons (cons e (car l)) (bigcons e (cdr l))))
    )
)
(defun power(l)
    (cond ((null l) '(nil))
        (t (append (power (cdr l)) (bigcons (car l) (power (cdr l)))))
    )
)
(setf A (power '(A)))
(format t "#|| power returns: ~a ||#~%~%" A)
#|| power returns: (NIL (A) NIL) ||#


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
(format t "#|| quicksort returns: ~a ||#~%~%" A)
#|| quicksort returns: (1 1 2 2 3 4 7 9) ||#


(defun replicate(l nlist)
    (cond ((or (null l) (null nlist)) nil)
        ((equal (car nlist) 0) (replicate (cdr l) (cdr nlist)))
        (t (append (list (car l)) (copy (car l)(- (car nlist) 1)) (replicate (cdr l) (cdr nlist))))
    )
)
(setf A (replicate '(A B C D E) '(1 0 4 3 2)))
(format t "#|| replicate returns: ~a ||#~%~%" A)
#|| replicate returns: (A C C C C D D D E E) ||#


(defun solve(l)
    (cond ((equal (car l) '=) (cadr l))
        ((equal (car l) '+) (- (solve (cddr l)) (cadr l)))
        ((equal (car l) '-) (+ (solve (cddr l)) (cadr l)))
        ((equal (car l) '*) (/ (solve (cddr l)) (cadr l)))
        ((equal (car l) '/) (* (solve (cddr l)) (cadr l)))
        (t (format t "~%Invalid string") 0)
    )
)
(setf A (solve '(* 10 / 2 + 2 / 3 + 3 / 2 = 6)))
(format t "#|| solve returns: ~a ||#~%~%" A)
#|| solve returns: 5 ||#


(defun tentotwo(num)
	(cond ((= num 0) nil)
		(t (append (tentotwo (truncate (/ num 2))) (list (mod num 2))))
	)
)
(setf A (tentotwo '52))
(format t "#|| tentotwo returns: ~a ||#~%~%" A)
#|| tentotwo returns: (1 1 0 1 0 0) ||#


(defun towersofhanoi(n one two three)
	(cond ((= n 0) nil)
		(t (append (towersofhanoi (- n 1) one three two) (list (list 'move 'ring n 'from 'peg one 'to 'peg two)) (towersofhanoi (- n 1) three two one)))
	)
)
(setf A (towersofhanoi '3 'one 'two 'three))
(format t "#|| towersofhanoi returns: ~a ||#~%~%" A)
#|| towersofhanoi returns: 
((MOVE RING 1 FROM PEG ONE TO PEG TWO) (MOVE RING 2 FROM PEG ONE TO PEG THREE)
 (MOVE RING 1 FROM PEG TWO TO PEG THREE) (MOVE RING 3 FROM PEG ONE TO PEG TWO)
 (MOVE RING 1 FROM PEG THREE TO PEG ONE)
 (MOVE RING 2 FROM PEG THREE TO PEG TWO) (MOVE RING 1 FROM PEG ONE TO PEG TWO)) ||#


(defun twototen(l)
    (cond ((null l) 0)
        (t (+ (* 2 (twototen (butlast l))) (car (last l))))
    )
)
(setf A (twototen '(1 1 0 1 0 0)))
(format t "#|| twototen returns: ~a ||#~%~%" A)
#|| twototen returns: 52 ||#


(defun unmerge(l)
    (cond ((null l) '(nil nil))
        (t (append (list (odd l)) (list (even l))))
    )
)
(defun odd(l)
    (cond ((null l) nil)
        (t (cons (car l) (odd (cddr l))))
    )
)
(defun even(l)
    (cond ((null l) nil)
        (t (append (odd (cdr l))))
    )
)
(setf A (unmerge '(1 2 3 4 5 6)))
(format t "#|| unmerge returns: ~a ||#~%~%" A)
#|| unmerge returns: ((1 3 5) (2 4 6)) ||#
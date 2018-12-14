#||
	This file contains a compilation of the Common LISP functions written both in class	and on my own for Language Structure (CPSC 3383) at UALR. The main purpose of this file is
	for easily loading into GNU CLISP 2.49 all of my work, and for checking output from the Read-Eval-Print-Loop (REPL). See below for an explanation of the code in each file.
||#

#|| 
	AltMerge.lisp - Takes two lists, (l1) and (l2) and adds them to one list 
	Returns - A list with the elements of (l1) and (l2) alternated in.
||#
(defun altmerge(l1 l2)																		; Define the function with two parameters, list one (l1) and list two (l2).
    (cond ((null l1) l2) 																	; IF list one is null return list two. 
        ((null l2) l1)																		; ELSE IF list two is null return list one.
        (t (cons (car l1) (altmerge (cdr l2) l1)) (cons (car l1) (altmerge l2 (cdr l1))))	; ELSE add first element in l1, recurse with rest l2, then alternate first element of l2, recurse with rest l1.
    )																						; Close cond.
)																							; Close defun.

#|| 
	Copy.lisp - Takes a symbol (s) and a number (n) and adds (s) to list (n) times
	Returns - A list containing the symbol (s), (n) number of times.
||#
(defun copy(s n)																			; Define the function with two parameters, symbol (s) and number (n).
    (cond ((equal n 0) nil)																	; IF the number n is 0, return nil. (Recursion stopper).
        (t (append (list s) (copy s (- n 1))))												; ELSE add the symbol (s) to the list, and recurse with the symbol and n - 1.
    )																						; Close cond.
)																							; Close defun.
#|| 
	An alternate method for this function is using a "for loop", Inspired by c++ background:
	(defun copy(s n)																		; Define the function with two parameters, symbol (s) and number (n).
		(loop for i from 1 to n 															; Loop the specified, n, number of times. (1-10) - loops 10 times.
			collect s																		; Collect (s), the symbol passed in into a list to return.
		)																					; Close loop.													
	)																						; Close defun.
||#

#|| 
	CountUp.lisp - Takes an element to count up (e) and a list (l)
	Returns - The number of occurences of element (e) in the list (l)
||#
(defun countup(e l)																			; Define the function with two parameters, element (e) and list (l).
	(cond ((null l) 0)																		; IF list is null, return 0. (Recursion stopper).
		((equal e (car l)) (+ 1 (countup e (cdr l))))										; ELSE IF e equals the first element, add 1, and recurse with list minus first element.
		(t (countup e (cdr l)))																; ELSE recurse with the element and the rest of the list.
	)																						; Close cond.
)																							; Close defun.

#||
	Cryptogram.lisp - Takes two words (w1) and (w2) tells if cryptograms
	Returns - T (true) if cryptograms, or NIL (False) if not cryptograms
	Requires - Super (supercrypto), crypto (cryptogram), and where (where) functions
||#
(defun supercrypto(w1 w2)																	; Define the function with two parameters, word one (w1) and word two (w2).
        (cond ((/= (length w1) (length w2)) nil)											; IF the words are not the same length return nil (DONT check words with different lengths).
            (t (cryptogram w1 w2))															; ELSE call the main cryptogram function that actually checks if the words are cryptograms.
        )																					; Close cond.
)																							; Close defun.

(defun cryptogram(w1 w2)																	; Define the function with two parmeters, word one (w1) and word two (w2).
    (cond ((null w1) (null w2))																; IF word one is null return word two is null as well (returns true when both words reach this).
        ((equal (where (car w1) (cdr w1)) (where (car w2) (cdr w2)))						; ELSE IF the locations of the letter in each word are the same, recurse with the rest of the words,
		 (cryptogram (cdr w1) (cdr w2)))													; letters to check them as well.
        (t nil)																				; ELSE if we make it this far, return nil. 
    )																						; Close cond.
)																							; Close defun.

(defun where(e l)																			; Define the function with two parameters, element (e) and list (l).
    (cond ((null l) 0)																		; If the list is null, return 0. (Recursion stopper).
        ((equal e (car l)) 0)																; ELSE IF the element (e) equals the letter, return 0.
        (t (+ 1 (where e (cdr l))))															; ELSE add one and recurse with the rest of the list.
    )																						; Close cond.
)																							; Close defun.

#|| 
	DeleteNeg.lisp - Takes a list (l) and removes negative numbers from it
	Returns - A list based on the input list (l) without negative numbers
||#
(defun deleteneg(l)																			; Define the function with one parameter, list (l).
	(cond ((null l) nil)																	; IF the list is null, return nil. (Recursion stopper).
		((< (car l) 0) (deleteneg (cdr l)))													; ELSE IF first element less than 0 (negative), recurse with list minus first element.
		(t (cons (car l) (deleteneg (cdr l))))												; ELSE add the first element to the list, recurse with list minus first element.
	)																						; Close cond.
)																							; Close defun.

#||
	Fib.lisp - Takes first number (f), second number (s), and a number (n). 
	Returns - A list that contains (f), (s), and the next (n) fib numbers.
||#
(defun fib(f s n)																			; Define the function with three parameters, first (f), second (s) and number (n).
    (cond ((= n 0) nil)																		; If the number is 0, return nil. (Recursion stopper).
        (t (cons f (fib s (+ f s) (- n 1))))    											; Else construct a list with the first fibonacci number passed, and the next fib number.
    )																						; Close cond.
)																							; Close defun.

#||
	Inc.lisp - Takes a number list (numlist) and adds one to each element in numlist
	Returns - A list with each element incremented by one
||#
(defun inc(numlist)																			; Define the function with one parameter, number list (numlist).
    (cond ((null numlist) nil)																; IF the number list is null, return nil. (Recursion stopper).
        (t (cons (+ 1 (car numlist)) (inc (cdr numlist))))									; ELSE add one to the list element and recurse with the rest of the number list.
    )																						; Close cond.
)																							; Close defun.

#|| 
	LoadFile.lisp - Takes no parameters and prompts the user to open a file
	Returns - "Loading file %FILE%.lisp" AND "Loaded file %FILE%.lisp"
||#
(defun loadfile()																			; Define the function with no parameters.
	(cd "C:\\Users\\Danny\\Desktop\\LISP\\Source\\")										; Change to my LISP source code directory.
	(format t "Enter the name of the file to open: ")										; Ask the user to enter the name of the file to open.
	(setf %FILE% (read))																	; Declare a variable %FILE%, and assign it to the value the user entered.
	(load %FILE%)																			; Load the file. Note: (load %PATH%) does the same, but this saves time.
)																							; Close defun.

#|| 
	MakeChange.lisp - Takes an amount (amt) and denomination list (denom)
	Returns - The number of ways to make the (amt) in change with the list (denom) 
||#
(defun makechange(amt denom)																; Define the function with two parameters, amount (amt) and denomination list (denom).
	(cond ((or (< amt 0)(null denom)) 0)													; IF the amount (amt) is less than 0 OR the denomination list (denom) is null, return 0.
		((= amt 0 ) 1)																		; ELSE IF amount (amt) equals 0, return 1
		(t (+ (makechange(- amt (car denom)) denom)(makechange amt (cdr denom))))			; ELSE add up the number of ways to make change for that denomination and the next denomination
	)																						; Close cond.
)																							; Close defun.

#|| 
	MergeSort.lisp - Takes two lists, (nlist1) and (nlist2), and merege sorts them
	Returns - A list that contains the merged combination in acsending order
||#
(defun mergesort(nlist1 nlist2)																; Define the function with two parameters, numlist 1 (nlist1) and numlist 2 (nlist2).
    (cond ((null nlist1) nlist2)															; IF nlist1 is null, return nlist2.
		((null nlist2) nlist1)																; ELSE IF nlist2 is null return nlist1.
        ((< (car nlist1) (car nlist2)) (cons (car nlist1) (mergesort (cdr nlist1) nlist2)))	; ELSE IF the element of nlist1 is less than element of nlist2, add it to list, recurse.
        (t (cons (car nlist2) (mergesort nlist1 (cdr nlist2))))								; ELSE the element of nlist2 is less than element of nlist1, add it to list, recuse.
    )																						; Close cond.
)																							; Close defun.

#|| 
	PairUp.list - Takes a list (l) and pairs up every 2 elements together
	Returns - A list where every other element is grouped together in a list
||#
(defun pairup(l)																			; Define the function with one parameter, list (l).
    (cond ((null l) nil)																	; IF the list (l) is null, return nil. (Recursion stopper).
		((null (cdr l)) (list l))															; ELSE IF cdr l is null, return list l. (In case of an odd number of elements).
        (t (append (list (list (car l) (car (cdr l))))(pairup (cdr (cdr l)))))				; ELSE append the list of the list of the first element and the next element, recurse 2 elements.
    )																						; Close cond.
)																							; Close defun.

#|| 
	Palindrome.lisp - Takes a list and determines if it contains a palindrome
	Returns - T (true) if it is a palindrome or NIL (false) if not a palindrome
||#
(defun palindrome(l)																		; Define the function with one parameter, list (l).
	(cond ((null l) t)																		; IF the list is null, return true. (Recursion stopper).
		((equal (car l)(car (last l)))(Palindrome(cdr (butlast l))))						; ELSE IF the first element equals the last, recurse with the list minus the first and last element.
		(t nil)																				; ELSE return nil (not a palindrome).
	)																						; Close cond.
)																							; Close defun.

#|| 
	Parens.lisp - Takes a list (l) and adds each element to new a list
	Returns - A list that resembles the following form (A (A (A)))
||#
(defun parens(l)																			; Define the function with one parameter, list (l).
	(cond ((null l) nil)																	; IF the list (l) is null, return nill. (Recursion stopper).
        ((null (cdr l)) l)																	; ELSE IF cdr l is null, return l. (In case of a list ending in nil).
        (t (list (car l) (parens (cdr l))))													; ELSE make a list of the first element and rescurse with the rest of the list.
    )																						; Close cond.
)																							; Close defun.

#||
	Power.lisp - Takes an element (e) and a list (l).
	Returns - A list containing the superset of all combined elements in the list.
||#
(defun bigcons(e l)																			; Define the function with two parameters, element (e) and list (l).
    (cond ((null l) '(nil))																	; IF the list (l) is null, return list (nil). (Recursion stopper).
        (t (cons (cons e (car l)) (bigcons e (cdr l))))										; ELSE Construct a list with the element, the list, and the remaining list elements.
    )																						; Close cond.
)																							; Close defun.
(defun power(l)																				; Define the function with one parameter, list (l).
    (cond ((null l) '(nil))																	; IF the list (l) is null, return list (nil). (Recursion stopper).
        (t (append (power (cdr l)) (bigcons (car l) (power (cdr l)))))						; ELSE append the rest of the elements in the list with the results of the bigcons function.
    )																						; Close cond.
)																							; Close defun.

#||
	QuickSort.lisp - Takes an element (e) and list (l), and quicksorts it
	Returns - A list that has been sorted using the quicksort algorithm
	Requires - The less than (lt) and greater than or equal (ge) functions
||#
(defun lt(e l)																				; Define the function with two parameters, element (e) and list (l).
	(cond ((null l) nil)																	; IF the list (l) is null, return nil. (Recursion stopper).
		((< (car l) e) (cons (car l) (lt e (cdr l))))										; ELSE IF the element in the list is less than e, add it to the list, and recurst with the rest of the list.
		(t (lt e (cdr l)))																	; ELSE recurse with the rest of the list.
    )																						; Close cond.
)																							; Close defun.

(defun ge(e l)																				; Define the function with two parameters, element (e) and list (l).
    (cond ((null l) nil)																	; IF the list (l) is null, return nil. (Recursion stopper).
        ((>= (car l) e) (cons (car l) (ge e (cdr l))))										; ELSE IF the element in the list is greater than/equal to e, add it to the list, and recurse with rest of list.
        (t (ge e (cdr l)))																	; ELSE recurse with the rest of the list.
    )																						; Close cond.
)																							; Close defun.

(defun quicksort(l)																			; Define the function with one parameter, list (l).
	(cond ((null (cdr l)) l)																; IF the next element is null return the current element. (Recursion stopper).
		(t (append (quicksort (lt (car l) (cdr l))) (list (car l)) 							; ELSE add the less than elements to the list (recursively), followed by the pivot, 
		   (quicksort (ge (car l) (cdr l)))))												; followed by the greather than elements added to the list (recursively).
    )																						; Close cond.
)																							; Close defun.

#||
	Replicate.lisp - Takes two lists of symbols (l) and number list (nlist) 
	Returns - A list of each symbol printed nlist times based on position
	Requires - The copy (copy) function (includes the alternate copy method) 
||#
(defun copy(s n)																			; Define the function with two parameters, symbol (s) and number (n).
    (cond ((equal n 0) nil)																	; IF the number n is 0, return nil. (Recursion stopper).
        (t (append (list s) (copy s (- n 1))))												; ELSE add the symbol (s) to the list, and recurse with the symbol and n - 1.
    )																						; Close cond.
)																							; Close defun.
#|| 
	An alternate method for this function is using a "for loop", Inspired by c++ background:
	(defun copy(s n)																		; Define the function with two parameters, symbol (s) and number (n).
		(loop for i from 1 to n 															; Loop the specified, n, number of times. (1-10) - loops 10 times.
			collect s																		; Collect (s), the symbol passed in into a list to return.
		)																					; Close loop.													
	)																						; Close defun.
||#

(defun replicate(l nlist)																	; Define the function with two parameters, list (l) and number list (nlist).
    (cond ((equal (car nlist) 0) (replicate (cdr l) (cdr nlist)))							; IF the number in nlist is a 0, recurse with the rest of both lists. (skip the element in both lists).
            ((or (equal (car l) nil) (equal (car nlist) nil)) nil)							; ELSE IF either of the lists are nil, return nil. (Recursion stopper).
            (t (append (list (car l)) (copy (car l)(- (car nlist) 1)) 						; ELSE add the element, call the copy function with nlist - 1, then recurse with the rest of both lists,
				(replicate (cdr l) (cdr nlist))))											; this line is the recursive call.
    )																						; Close cond.
)																							; Close defun.

#||
	Solve.lisp - Takes a list that contains an equation (l).
	Returns - The solution (s) of the missing value on the left side of the equation.
||#
(defun solve(l)																				; Define the function with one parameter, list (l).
    (cond ((equal (car l) '=) (cadr l))														; If the current list (l) element is the equals sign, return the element to the right.
        ((equal (car l) '+) (- (solve (cddr l)) (cadr l)))									; ELSE IF the current list (l) element is the + sign, subtract the two operands.
        ((equal (car l) '-) (+ (solve (cddr l)) (cadr l)))									; ELSE IF the current list (l) element is the - sign, add the two operands.
        ((equal (car l) '*) (/ (solve (cddr l)) (cadr l)))									; ELSE IF the current list (l) element is the * sign, divide the two operands.
        ((equal (car l) '/) (* (solve (cddr l)) (cadr l)))									; ELSE IF the current list (l) element is the / sign, multiply the two operands.
        (t (format t "~%Invalid string") 0)													; ELSE alert the user of an invalid string, and return 0,
    )																						; Close cond.
)																							; Close defun.

#|| 
	TenToTwo.lisp - Takes a decimal number and converts it to binary
	Returns - A list containing the decimal number (num) in binary
||#
(defun tentotwo(num)																		; Define the function with one parameter, decimal number (num).
	(cond ((= num 0) nil)																	; IF the decimal number equals 0, return nil. (Recursion stopper).
		(t (append (tentotwo (truncate (/ num 2))) (list (mod num 2))))						; ELSE append the truncated decimal number / 2 with the list containing decimal number mod 2.
	)																						; Close cond.
)																							; Close defun.

#|| 
	TowersOfHanoi.lisp - Takes a number of rings (n) and three pegs, (one), (two), and (three)
	Returns - A list of the moves required to stack all of the rings on a different peg
||#
(defun towersofhanoi(n one two three)														; Define the function with four parameter, num rings (n), and three pegs, (one), (two), and (three).
	(cond ((= n 0) nil)																		; IF the number of rings equals 0, return nil. (Recursion stopper).
		(t (append (towersofhanoi (- n 1) one three two) 									; ELSE append the result of ring - 1 on peg one two three with
		   (list (list 'move 'ring n 'from 'peg one 'to 'peg two))							; The list of the list 'move 'ring n 'from 'peg one 'to 'peg two
		   (towersofhanoi (- n 1) three two one)))											; and the result of ring - 1 on peg three two one.
	)																						; Close cond.
)																							; Close defun.

#|| 
	TwoToTen.lisp - Takes a binary list and returns the number in decimal
	Returns - The decimal number converted from the binary list (l)
||#
(defun twototen(l)																			; Define the function with one parameter, list (l).
    (cond ((null l) 0)																		; IF the list is null, return 0. (Recursion stopper).
        (t (+ (* 2 (twototen (butlast l)))(car (last l))))									; ELSE add two times the current element and the last element.
    )																						; Close cond.
)																							; Close defun.

#||
	UnMerge.lisp - Takes a list (l) and unmerges it into two sub-lists
	Returns - a list of two unmerged sub-lists (unmerges alternate elements)
	Requires - The odd (odd) and even (even) functions
||#
(defun odd(l)																				; Define the function with one parameter, list (l).
    (cond ((null l) nil)																	; IF the list is null, return nil.
        (t (cons (car l) (odd (cddr l))))													; ELSE add the alternating odd indexed elements to the first sub-list.
    )																						; Close cond.
)																							; Close defun.

(defun even(l)																				; Define the function with one parameter, list (l).
    (cond ((null l) nil)																	; IF the list is null, return nil.
        (t (append (odd (cdr l))))															; ELSE add the alternating even indexed elements to the second sub-list.
    )																						; Close cond.
)																							; Close defun.

(defun unmerge(l)																			; Define the function with one parameter, list (l).
    (cond ((null l) '(nil nil))																; IF the list is null, return (nil nil). (specified due to the fact that the resulting output is two sub-lists)
        (t (append (list (odd l)) (list (even l))))											; ELSE add the odd list and even list to one single list to be returned.
    )																						; Close cond.
)																							; Close defun.
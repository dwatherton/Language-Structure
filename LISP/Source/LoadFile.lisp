(defun loadfile()
	(cd "C:\\Users\\Danny\\Desktop\\LISP\\Source\\")
	(format t "Enter the name of the file to open: ")
	(setf %FILE% (read))
	(load %FILE%)
)
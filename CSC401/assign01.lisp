; Sumof (x) - Sum of the number x, x-1, x-2,...,1
(defun sumof (x) 
	(cond ((= (car x) 1) 1)
	      (T (+ (car x) (sumof (list (- (car x) 1)))))
	)
)
		  
; removesecond (l) - Remove the second item in the list l
(defun removesecond (l) 
	(append (list (car l)) (cddr l))
)

; countnums (l) - Count the occurence of number types in the list l
(defun countnums (l)
	(cond ((equal L nil) 0) 
	      ((numberp (car l)) (+ 1 (countnums (cdr l)))) 
	      (T (countnums (cdr l)))
	)
)

; countallx (a l) - Count the number of occurences of the atom a in list l
(defun countallx (a l) 
	(cond ((equal L nil) 0) 
	      ((equal a (car l)) (+ 1 (countallx a (cdr l)))) 
		  ((listp (car l)) (countallx a (append (car l) (cdr l))))
		  (T (countallx a (cdr l)))
	)
)

; - filternum (L) - Remove all non-numeric atoms in list L
(defun filternum (L)
	(cond ((equal L NIL) NIL)
          ((numberp (car L)) (cons (car L) (filternum (cdr L))))
		  (T (filternum (cdr L)))		  
	)
)

; - filterx (L) - Remove all numeric atoms in list L
(defun filterx (L)
	(cond ((equal L NIL) NIL)
          ((numberp (car L)) (filterx (cdr L)))
		  (T (cons (car L) (filterx (cdr L))))		  
	)
)
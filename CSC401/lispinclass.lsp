(defun getridof (A L) 
 (cond ((equal l nil ) NIL)
       ((equal A (car L)) (getridof A (cdr L))) 
	   (T (cons (car L) (getridof A (cdr L))))
	   ))
	   
(defun RASN (N L) 
	(cond ((equal L NIL) NIL)
		  ((listp (car L)) (cons (RASN N (car L)) (RASN N (cdr L))))
		  ((and (numberp (car L)) (< (car L) N)) (RASN N (cdr L)))
		  (T (cons (car L) (RASN N (cdr L))))
	)
)

XQGTR-MKV94-JT8YP-VGDGM-BVPC8
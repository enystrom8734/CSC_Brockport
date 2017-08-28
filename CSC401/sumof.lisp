(defun sumof (x)
	(if (= (car x) 1) 1
		(+ (car x) (sumof (list (- (car x) 1))))
	)
)
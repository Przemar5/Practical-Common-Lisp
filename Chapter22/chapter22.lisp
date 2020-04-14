
(defparameter foo '(+ 1 2))
(defparameter bar '(+ 3 4))

(defparameter baz `(* ,foo ,bar))

(defparameter db 0)
(defparameter conn `(if (> ,db 0)
			(princ "Connected")
			(princ "Cannot connect")))

(defun mac (x y)
  (eval `(+ ,x ,y)))

(mac '(* 1 2) '(* 3 4))

(defun mac2 (x y)
  (eval `(,(car x) ,@(cdr y))))

(mac2 '(+ 1 2 3) '(* 4 5 6))

(defun mac3 (l x y)
  (eval `(progn (print (,(car l) ,x ,y))
		(print (,(cadr l) ,x ,y))
		(print (,(caddr l) ,x ,y)))))

(mac3 '(+ * -) 4 5)

(defun mac4 (l &rest args)
  (eval `(progn (print (,(car l) ,@args))
		(print (,(cadr l) ,@args))
		(print (,(caddr l) ,@args)))))

(mac4 '(+ - *) 1 2 3 4 5)

(defmacro mac5 (l args)
  `(mapcar #',(car l) ',args))

(macroexpand-1 `(mac5 (sqrt)  (1 2 3 4 5)))

(mac5 (sqrt) (1 2 3 4 5))

(mapcar #'cons '(1 2 3) '(a b c))

(defun mac6 ()
  (progn (print (eval (caar (mapcar #'cons '(sqrt log) '(4 9)))))
	 (print (eval ))))




(defmacro to-power (&rest args)
  `(mapcar #'(lambda (x) (* x x)) ',args))

(macroexpand-1 `(to-power 1 2 3 4 5 6))


(defmacro mac7 (l n args)
  `(mapcar #',(nth n l) ',args))

(mac7 (sqrt) 0 (1 2 3 4 5))

(defmacro mac8 (ops &rest args)
  `(dotimes (i (length ,ops))
     (mac7 ,ops (- i 1) ',args)))

(macroexpand-1 `(mac8 '(sqrt log) 1 2 3 4 5))


(ql:quickload :for)

(defmacro mac8 (ops &rest args)
  `(loop :for i :from 0 :to (- (length ,ops) 1)
      do (mac7 ,ops i ',args)))

(macroexpand-1 `(mac8 '(sqrt log) 2 3 4 5 6))


(defun fun (n)
  (dotimes (i 0) (print i)))



(defun fun()
  (loop repeat 5 
     for x = 0 then y
     for y = 1 then (+ x y)
     collect y))

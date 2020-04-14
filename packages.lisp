(defpackage :com.gigamonkeys.email-db
  (:use :common-lisp))

(in-package :com.gigamonkeys.email-db)

(defun hello-world () (format t "hello from EMAIL-DB package~%"))

(defpackage :com.gigamonkeys.text-db
  (:use :common-lisp)
  (:export :open-db   
           :save
           :store))

(defpackage :com.gigamonkeys.email-db
  (:use :common-lisp :com.gigamonkeys.text-db))


(defpackage :com.gigamonkeys.email-db
  (:use
   :common-lisp
   :com.gigamonkeys.text-db
   :com.acme.text)
  (:import-from :com.acme.email :parse-email-address)
  (:shadow :build-index)
  (:shadowing-import-from :com.gigamonkeys.text-db :save))





(defpackage :com.gigamonkeys.spam
  (:use :common-lisp :com.gigamonkeys.pathnames))


(defpackage :com.gigamonkeys.email-db
  (:use :common-lisp))

(defpackage "COM.GIGAMONKEYS.EMAIL-DB"
  (:use "COMMON-LISP"))

(in-package :com.gigamonkeys.email-db)

(defun hello-world () (format t "hello from EMAIL-DB package~%"))

(defpackage :com.gigamonkeys.spam
  (:use :common-lisp :com.gigamonkeys.pathnames))

(defpackage :com.gigamonkeys.text-db
  (:use :common-lisp)
  (:export :open-db   
           :save
           :store))

(defpackage :com.gigamonkeys.email-db
  (:use :common-lisp :com.gigamonkeys.text-db))

(defpackage :com.gigamonkeys.email-db
  (:use :common-lisp :com.gigamonkeys.text-db)
  (:import-from :com.acme.email :parse-email-address))

(defpackage :com.gigamonkeys.email-db
  (:use
   :common-lisp
   :com.gigamonkeys.text-db
   :com.acme.text)
  (:import-from :com.acme.email :parse-email-address)
  (:shadow :build-index))

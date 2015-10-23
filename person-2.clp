(clear)
(deftemplate person "People in actuarial database"
    (slot age)
    (slot name)
    (slot gender))

(assert (person (name "Bob Smith") (age 34) (gender Male)))
(assert (person (gender Male) (name "Tom Smith") (age 32) ))
(assert (person (name "Mary Smith") (age 34) (gender Female)))
(assert (person (gender Female)))
(assert (person (name "Billy Bob") (gender Male)))
(assert (person (gender Male) (name "Jim") (age 22)))
(assert (person (gender Female) (name "Sue") (age 20)))

(defglobal ?*count* = 0 ?*sum* = 0)


(defrule males-avg-rule 
    (person (gender Male) (age ?a))
    =>
   (bind ?*count* (+ ?*count* 1))
   (bind ?*sum* (+ ?*sum* ?a )))
    
(deffunction show-avg ()
    (bind ?avg  (/ ?*sum* ?*count*))
    (printout t "The average male age is " ?avg crlf))
    
(run)
(show-avg)

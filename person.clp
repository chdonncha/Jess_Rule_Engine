(clear)

(deftemplate person "People in actuarial database"
    (slot age)
    (slot name)
    (slot gender))


(assert (person (name "Bob Smith") (age 34) (gender Male)))
(assert (person (gender Male) (name "Tom Smith") (age 32) (gender Male)))
(assert (person (name "Mary Smith") (age 34) (gender Female)))
(assert (person (gender Female)))


(defrule male-ages
    (person (name ?n) (age ?a) (gender Male) )
    =>
    (printout t ?n " is " ?a " years old " crlf))
    
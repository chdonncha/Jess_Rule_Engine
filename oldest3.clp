;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  Code to find oldest male
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(clear)

(deftemplate person "People in actuarial database"
    (slot age (default -1))
    (slot name )
    (slot gender))
	
(deftemplate oldest-male (slot name) (slot age))

(assert (person (gender Male) (name "Mitt Romney") (age 61) ))
(assert (person (name "Bob Smith") (age 34) (gender Male)))
(assert (person (gender Male) (name "Tom Smith") (age 32) ))
(assert (person (name "Mary Smith") (age 34) (gender Female)))
(assert (person  (name "George Bush") (gender Male)))

(assert (person (gender Female)))



(defrule oldest-male-rule
    ?old <- (oldest-male (age ?b))
    (person (name ?n) (age ?a &: (> ?a ?b)) (gender Male) )
    =>
    (modify ?old (name ?n) (age ?a))
    (printout t "Updating oldest-male" crlf)
)    
 
(defrule show-oldest-male
    ?f1 <- (done)
    ?f2 <- (oldest-male (name ?x) (age ?y))
     =>
    (printout t "Oldest male is " ?x " aged " ?y crlf)
    (retract ?f1)
    (retract ?f2)
)
     
(deffunction find-oldest-male ()
    (assert (oldest-male (age 0)))
    (run)
    (assert (done))
    (run)
)
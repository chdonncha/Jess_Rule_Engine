
;Using an (if ...) in the RHS (after =>) of the rule, extend the the Jess program oldest1.clp
;by completing the rule and function so that the name and age of ;the oldest male is displayed. 
;Modify oldest1.clp so that it uses a constraint with a predicate function on the LHS of the rule
;rather than an if function on the RHS. See page 106 of Jess ;in Action. Save program as oldest2.clp.

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
    ;Cycle through all the males to find the oldest age

    ?max-age <- (oldest-male (age ?a1))
    (person (age ?a2) (name ?n)  {age > ?a1} (gender Male) )
    =>
        (retract ?max-age)
        (assert (oldest-male (name ?n) (age ?a2)))
        (printout t "Cycling to find oldest male..." crlf))    
 
(defrule show-oldest-male
    ?f1 <- (done)
    ?f2 <- (oldest-male (name ?na) (age ?ag))
     =>
        (printout t "The oldest male is: " ?na " aged " ?ag crlf)
        (retract ?f1)
        (retract ?f2))
     
(deffunction to-find-oldest ()
    ; print out the oldest male after it has finished processing
    ; the rest of the calculations
    (assert (oldest-male (age 0)))
    (run) (assert (done)) (run))
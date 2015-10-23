; Rule r1 looks like it has no antecedent,
; but in fact it has an implicit one which is
; initial-fact. r1 won't fire until initial-fact
; is asserrted.

(defrule r1
     => 
     (assert (b))
)
    
(defrule r2
    ?f <- (b) 
    => 
    (retract ?f)  
    (assert (c))
)

(defrule r2a
     (b) 
     => 
     (assert (c2))
)



(defrule r3
    (c) 
    => 
    (assert (d))
    (do-something)
)

 

(deffunction do-something ()
    (printout t "I fired 3 rules" crlf))
    
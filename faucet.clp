(defrule turn-water-on
    (faucet open)
    =>
    (assert (water flowing)))

	
; here not means the absence of a fact, which is
; different a logical not in an if-statement.

(defrule turn-water-off
    (initial-fact)
    (not (faucet open))
    ?water <- (water flowing)
    =>
    (retract ?water))

	
(reset)    
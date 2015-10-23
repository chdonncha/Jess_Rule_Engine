(defrule change-baby-if-wet
    "if bay is wet, change nappy"
    ?w <- (baby-is-wet)
    =>
    (change-baby)
    (retract ?w)
)


(deffunction change-baby ()
  (printout t "baby is now being changed" crlf))
  
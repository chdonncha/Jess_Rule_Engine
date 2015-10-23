(clear)

(assert (car moving))
(assert (traffic-light green))

(defrule traffic-stop-rule
(traffic-light red)  
(not (traffic-light green))  ; means fact not in database
?c <- (car moving)
=>
(printout t "Stop car as light has changed to red" crlf)
(retract ?c)
(assert (car stopped))
)
(clear)

(deftemplate person "People in actuarial database"
    (slot age)  (slot name)  ()slot gender))

(assert (person (name "sue") (gender Female) (age 7)))    
(assert (person (name "Bob Smith") (age 34) (gender Male)))
(assert (person (name "Tom Smith") (age 32) (gender Male)))
(assert (person (name "Mary Smith") (age 36) (gender Female)))

(defglobal ?*min* = 200  ?*min-name* = "")

(defrule youngest-rule-1
    (person (name ?n) (age ?a ))
    =>
    (if (< ?a ?*min*) then
       (printout t "New youngest person " ?n " age " ?a " prev age was " ?*m* crlf)
       (bind ?*min* ?a)
       (bind ?*min-name* ?n)))

(defrule youngest-rule-2   
    (person (name ?n) (age ?a & :(< ?a ?*min*)))
    =>
    (printout t "New youngest person " ?n " age " ?a " prev age was " ?*m* crlf)
    (bind ?*min* ?a)
    (bind ?*min-name* ?n))


(deftemplate youngest (slot name) (slot age))
(assert (youngest  (age 200))
   
(defrule youngest-rule-3
    ?y <- (youngest (age ?b))
    (person (name ?n) (age ?a & :(< ?a ?b)))
    =>
    (printout t "New youngest person " ?n " age " ?a " prev age was " ?*m* crlf)
    (retract ?y)
    (assert (youngest (age ?a) (name ?n)))
)
  

    
(defrule youngest-rule-4
    ?y <- (youngest (age ?b))
    (person (name ?n) (age ?a & :(< ?a ?b)))
    =>
    (printout t "New youngest person " ?n " age " ?a " prev age was " ?*m* crlf)
    
    (modify ?y (age ?a) (name ?n))
)


       

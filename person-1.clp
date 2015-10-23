(clear)
(deftemplate person "People in actuarial database"
    (slot age)
    (slot name)
    (slot gender))

(assert (person (name "Bob Smith") (age 34) (gender Male)))
(assert (person (age 30) (name "Michael Smith") ))
(assert (person (gender Male) (name "Tom Smith") (age 32) ))
(assert (person (name "Mary Smith") (age 34) (gender Female)))
(assert (person (gender Female)))

(defglobal ?*count* = 0)

(defrule count-males-rule
    (person (gender Male) )
    =>
    (bind ?*count* (+ ?*count* 1)))
        
(deffunction show-male-count ()
    (printout t "The male count is " ?*count* crlf))
    
(run)  
(show-male-count)
  
    
    
    
(clear)
(watch all)
(deftemplate person
  (slot name)
  (slot age))

; Your queries
(defquery person-by-age
  (declare (variables ?_age))
  (person (name ?name) (age ?age&:(> ?age ?_age))))

(defquery find-oldest
  (person (name ?name1) (age ?age1))
  (not (person (name ?name2) (age ?age2&:(> ?age2 ?age1)))))

; Load some facts
(deffacts init
  (person (name Ann) (age 12))
  (person (name Bob) (age 14))
  (person (name Carl) (age 8))
  (person (name David) (age 11))
  (person (name Ed) (age 9)))

; Reset the rule engine to load our facts
(reset)

; Get the result sets for the queries
(bind ?result1 (run-query* person-by-age 10))
(bind ?result2 (run-query* find-oldest))

; Print out the results
(while (?result1 next)
    (printout t
      (?result1 getString name) ", age "
      (?result1 getInt age) crlf))

(while (?result2 next)
    (printout t "Oldest is: "
      (?result2 getString name1) ", age "
      (?result2 getInt age1) crlf))
(clear)

(bind ?l (create$ 1 2 3 4 5))
(bind ?pl (create$ milk 2.40 eggs 1.50 bread 1 specialK 4 sugar 2.30 tea 2 coffee 3)) 


    

(deffunction avg (?l)
    (bind ?n (length$ ?l))
    (bind ?i 0)
    (bind ?sum 0)
    (while (< ?i ?n) do
        (bind ?i (+ ?i 1))
        (bind ?sum (+ ?sum 
                       (nth$ ?i ?l))))
    (return (/ ?sum ?n)))
 
 
(deffunction avg2 (?l)
    (bind ?n (length$ ?l))
    (bind ?sum 0)
    (foreach ?i ?l
        (bind ?sum (+ ?sum ?i)))                   
    (return (/ ?sum ?n)))
    
    
                 
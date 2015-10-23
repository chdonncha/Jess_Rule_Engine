

    (defrule ancestor-rule 

        (or (parent ?a ?b) 

            (and (parent ?a ?c) (ancestor ?c ?b)) )
        => 

        (assert (ancestor ?a ?b)))

    (assert (parent andy betty))
    (assert (parent betty charlie))
    (assert (parent charlie donna))


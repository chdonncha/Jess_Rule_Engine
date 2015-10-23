(reset)

; rule to get program going
(defrule go-rule-1
    =>
    (printout t "What sort of environment is a trainee dealing with on the job? " crlf)
    (bind ?e (read))
    (assert (environment ?e))
    (run)
)

; alternative 2 with logical or
(defrule env-rule-1
    (environment ?e & :(or (= ?e papers) (= ?e manuals) (= ?e documents) (= ?e textbooks)))
     =>
    (assert (stimulus-situation verbal))
)

(defrule env-rule-2
    (environment ?e & :(or (= ?e pictures) (= ?e illustrations) (= ?e photographs) (= ?e diagrams)))
     =>
    (assert (stimulus-situation visual))
)

(defrule env-rule-3
   (environment ?e & :(or (= ?e machines) (= ?e buildings) (= ?e tools)))
     =>
    (assert (stimulus-situation 'physical object'))
)

(defrule env-rule-4
    (environment ?e & :(or (= ?e numbers) (= ?e formulas) (= ?e 'computer programs')))
     =>
    (assert (stimulus-situation symbolic))
)

(defrule job-rule-1
    (job ?e & :(or (= ?e lecutring) (= ?e advising) (= ?e counselling)))
     =>
    (assert (stimulus-response oral))
)

(defrule job-rule-2
    (job ?e & :(or (= ?e building) (= ?e repairing) (= ?e troubleshooting)))
     =>
    (assert (stimulus-response 'hands-on'))
)

(defrule job-rule-3
    (job ?e & :(or (= ?e writing) (= ?e typing) (= ?e drawing)))
    =>
   (assert (stimulus-response doucmented))
)

(defrule job-rule-4
    (job ?e & :(or (= ?e evaluating) (= ?e reasoning) (= ?e investigating)))
     =>
    (assert (stimulus-response analytical))
)

(defrule stimulus-rule-1
    (and
        (stimulus-situation 'physical-object')
        (stimulus-response 'hands-on')
        (feedback-required)
    )
     =>
    (assert (medium workshop))
)

(defrule stimulus-rule-2
    (and
        (stimulus-situation visual)
        (stimulus-response documented)
        (feedback-not_required)
    )
     =>
    (assert (medium videocassette))
)

(defrule stimulus-rule-3
    (and
        (stimulus-situation visual)
        (stimulus-response oral)
        (feedback-required)
    )
     =>
    (assert (medium 'lecture-tutorial'))
)

(defrule stimulus-rule-3
    (and
        (stimulus-situation verbal)
        (stimulus-response analytic)
        (feedback-required)
    )
     =>
    (assert (medium 'lecture-tutorial'))
)

(defrule stimulus-rule-5
    (and
        (stimulus-situation verbal)
        (stimulus-response oral)
        (feedback-required)
    )
     =>
    (assert (medium 'role-play-exercises'))
)

(defrule prinout
    =>
    (printout t "Job selected is: " ?e crlf)
     ;(if (?e = null) then
)

(run)

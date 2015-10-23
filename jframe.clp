; -*- clips -*-

;; **********************************************************************
;;                           Frame.clp
;;
;; A nifty example of building a a Swing GUI using jess reflection.
;; Using this package, we can create java objects, call their methods,
;; access their fields, and respond to GUI events.
;; You can therefore build an entire GUI application without actually
;; writing any Java code!
;;
;; **********************************************************************

;; ******************************
;; Declarations

(import javax.swing.*)
;; Explicit import so we get JFrame.EXIT_ON_CLOSE
(import javax.swing.JFrame) 
(import java.awt.event.ActionListener)
(import java.awt.BorderLayout)
(import java.awt.Color)

;; ******************************
;; DEFGLOBALS

(defglobal ?*f* = 0)
(defglobal ?*c* = 0)
(defglobal ?*f* = 0)
(defglobal ?*e* = '')

;; ******************************


;(reset)


;; DEFFUNCTIONS

(deffunction create-frame ()
  (bind ?*f* (new JFrame "Jess Reflection Demo"))
  (new java.awt.Button "Hello"))
  (bind ?*c* (?*f* getContentPane))
  (bind ?*afield* (new JTextField 40))
  (bind ?*afield-ok* (new JButton OK))
  (set ?*c* background (Color.magenta)))

(defrule env-rule-1
    (environment ?*e* & :(or (= ?*e* papers) (= ?*e* manuals) (= ?*e* documents) (= ?*e* textbooks)))
     =>
    (assert (stimulus-situation verbal))
    (printout t "it worked scotty!")
)
(deffunction add-widgets ()
  (?*c* add (new JLabel "This is: ") (BorderLayout.CENTER))
  (bind ?*m* (new JComboBox))

  (?*m* addItem "Cool")
  (?*m* addItem "Really Cool")
  (?*m* addItem "Awesome")
  (?*m* addItem "OMG!")
  ;(?*m* add ?*afield*)
  (?*c* add ?*m* (BorderLayout.SOUTH))

  (?*c* add (new JLabel "This is: ") (BorderLayout.CENTER))

  (?*c* add ?*afield* (BorderLayout.NORTH))
  (?*c* add ?*afield-ok* (BorderLayout.NORTH))

)

;(deffunction read-input (?*e*VENT)
;  (bind ?text *sym-cat (?*afield* getText)))
;  (assert (ask::user-input ?text)))
;
;(bind ?handler
;  (new jess.awt.ActionListener read-input (engine)))
;(?*afield* addActionListener ?handler)
;(?*afield-ok* addActionListener ?handle)
;)

(deffunction add-behaviours ()
  (?*f* setDefaultCloseOperation (JFrame.EXIT_ON_CLOSE))

  (?*m* addActionListener (implement ActionListener using
    (lambda (?name ?*e*vent)
      (printout t "You chose: " (get ?*m* selectedItem) crlf)
      )
    )
  )
  

 (?*afield* addActionListener (implement ActionListener using
    (lambda (?name ?*e*vent)
        (printout t "You chose: " (?*afield* getText) crlf)
        (bind ?*e* (?*afield* getText))
        (assert(environment ?*e* (?*afield* getText)))     
        ;(clear)
        (printout t "Job you have selected: " ?*e* crlf)
        ;(run)
        (facts)
      )
    )
  )
)

(deffunction show-frame ()
  ;(?*f* pack)
    (?*f* setSize 200 300)
  (?*f* setVisible TRUE)
)


;; ******************************
;; Run the program


(defrule init-rule
    (initial-fact)
    =>
    (create-frame)
    (add-widgets)
    (add-behaviours)
    (show-frame))

(reset)
(run)


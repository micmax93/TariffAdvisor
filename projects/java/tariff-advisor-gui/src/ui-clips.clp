(deftemplate ui-state
    (slot key (type SYMBOL))
    (slot value (type SYMBOL))
)

(deftemplate answer
    (slot key (type SYMBOL))
    (slot value (type SYMBOL NUMBER))
)


; starting question
(deffacts start-ui-state
    (ui-state (key question) (value NETWORK))
)


(defrule question-rule-1
    (answer (key NETWORK) (value ?))
    ?i <- (ui-state (key question) (value NETWORK))
=>
    (retract ?i)
    (assert (ui-state (key question) (value MAXCOST)))
)

(defrule question-rule-2
    (answer (key MAXCOST) (value ?))
    ?i <- (ui-state (key question) (value MAXCOST))
=>
    (retract ?i)
    (assert (ui-state (key question) (value CALLPACKETS)))
)

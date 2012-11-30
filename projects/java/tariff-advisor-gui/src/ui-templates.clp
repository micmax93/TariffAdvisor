(deftemplate doWykonania
    (slot siec_docelowa (type SYMBOL))
    (slot min (type NUMBER))
    (slot sms (type NUMBER))
    (slot mms (type NUMBER))
    (slot net (type NUMBER))
)

(deftemplate ui-state
    (slot key (type SYMBOL))
    (slot value (type SYMBOL))
)

(deftemplate answer
    (slot key (type SYMBOL))
    (slot value (type SYMBOL NUMBER))
)

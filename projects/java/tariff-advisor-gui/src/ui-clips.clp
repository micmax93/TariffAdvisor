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




; ==========================================================
; CALL PACKET QUESTIONS
; ==========================================================

; brak zainteresowania rozmowami, zrob skip do smsow
(defrule question-rule-callpackets-false
    (answer (key CALLPACKETS) (value false))
    ?i <- (ui-state (key question) (value CALLPACKETS))
=>
    (retract ?i)
    (assert (ui-state (key question) (value SMSPACKETS)))
)


; zapytanie o rozmowy (w sieci swojej / w innych)
(defrule question-rule-callpackets-1
    (answer (key CALLPACKETS) (value true))
    ?i <- (ui-state (key question) (value CALLPACKETS))
=>
    (retract ?i)
    (assert (ui-state (key question) (value CALLNETWORK)))
)

; zapytanie o wybrane osoby
(defrule question-rule-callpackets-2
    (answer (key CALLNETWORK) (value ?))
    ?i <- (ui-state (key question) (value CALLNETWORK))
=>
    (retract ?i)
    (assert (ui-state (key question) (value CALLFAVOURITE)))
)

; skip do sms pakietow
(defrule question-rule-callpackets-3
    (answer (key CALLFAVOURITE) (value ?))
    ?i <- (ui-state (key question) (value CALLFAVOURITE))
=>
    (retract ?i)
    (assert (ui-state (key question) (value SMSPACKETS)))
)

; ==========================================================
; END CALL PACKET QUESTIONS
; ==========================================================






; ==========================================================
; SMS PACKET QUESTIONS
; ==========================================================

; w przypadku braku zainteresowania smsami zapytaj o pakiety internetowe
(defrule question-rule-sms-3
    (answer (key SMSPACKETS) (value false))
    ?i <- (ui-state (key question) (value SMSPACKETS))
=>
    (retract ?i)
    (assert (ui-state (key question) (value NETPACKETS)))
)

; w przypadku zainteresowania smsami zapytaj o najczestsza siec do ktorej pisze
(defrule question-rule-sms-4
    (answer (key SMSPACKETS) (value true))
    ?i <- (ui-state (key question) (value SMSPACKETS))
=>
    (retract ?i)
    (assert (ui-state (key question) (value SMSFAVOURITE)))
)

; skip do net pakietow
(defrule question-rule-sms-5
    (answer (key SMSFAVOURITE) (value ?))
    ?i <- (ui-state (key question) (value SMSFAVOURITE))
=>
    (retract ?i)
    (assert (ui-state (key question) (value NETPACKETS)))
)

; ==========================================================
; END SMS PACKET QUESTIONS
; ==========================================================







; ==========================================================
; NET PACKET QUESTIONS
; ==========================================================

; w przypadku braku zainteresowania internetem idz do pytan ogolnych
(defrule question-rule-net-1
    (answer (key NETPACKETS) (value false))
    ?i <- (ui-state (key question) (value NETPACKETS))
=>
    (retract ?i)
    (assert (ui-state (key question) (value CALLCOUNT)))
)

; zapytaj o zuzycie netu
(defrule question-rule-net-2
    (answer (key NETPACKETS) (value true))
    ?i <- (ui-state (key question) (value NETPACKETS))
=>
    (retract ?i)
    (assert (ui-state (key question) (value NETUSAGE)))
)

; skip do pytan ogolnych
(defrule question-rule-net-3
    (answer (key NETUSAGE) (value ?))
    ?i <- (ui-state (key question) (value NETUSAGE))
=>
    (retract ?i)
    (assert (ui-state (key question) (value CALLCOUNT)))
)


; ==========================================================
; END NET PACKET QUESTIONS
; ==========================================================







; ==========================================================
; GENERAL QUESTIONS
; ==========================================================

; ilosc rozmow
(defrule question-rule-global-1
    (answer (key CALLCOUNT) (value ?))
    ?i <- (ui-state (key question) (value CALLCOUNT))
=>
    (retract ?i)
    (assert (ui-state (key question) (value CALLLENGTH)))
)

; dlugosc rozmow
(defrule question-rule-global-2
    (answer (key CALLLENGTH) (value ?))
    ?i <- (ui-state (key question) (value CALLLENGTH))
=>
    (retract ?i)
    (assert (ui-state (key question) (value SMSCOUNT)))
)

; po ostatnim pytaniu ustaw ui-state na init-calc
(defrule question-rule-global-3
    (answer (key SMSCOUNT) (value ?))
    ?i <- (ui-state (key question) (value SMSCOUNT))
=>
    (retract ?i)
    (assert (ui-state (key init-calc) (value true)))
)

; ==========================================================
; END GENERAL QUESTIONS
; ==========================================================


; ==========================================================
; CONCLUSION
; ==========================================================

; tymczasowa regula ktora powoduje wygenerowanie faktu o obecnosci wynikow
(defrule rule-start-conclusion
    ?i <- (ui-state (key init-calc) (value true))
=>
    (retract ?i)
    (assert (ui-state (key results-ready) (value true)))
)
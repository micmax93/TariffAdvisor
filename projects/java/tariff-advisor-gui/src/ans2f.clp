; ============================================
; uzupelnienie brakujacych faktow z odpowiedzi

(defrule no-sms-network-specified
    (answer (key SMSPACKETS) (value false))
=>
    (assert (answer) (key SMSNETWORK) (value various))
)

(defrule no-call-network-specified
    (answer (key CALLPACKETS) (value false))
=>
    (assert (answer) (key CALLNETWORK) (value various))
)

; ============================================



; ============================================
; rozmowy w swojej sieci
; smsy w swojej sieci
; ============================================
(defrule wyk-rozm-1
    (answer (key NETWORK) (value ?siec))

    (answer (key CALLNETWORK) (value self))
    (answer (key CALLCOUNT) (value ?ile))
    (answer (key CALLLENGTH) (value ?dlugosc))

    (answer (key SMSNETWORK) (value self))
    (answer (key SMSCOUNT) (value ?ilesms))
=>
    (assert (doWykonania (siec_docelowa ?siec)
        (min (* ?ile ?dlugosc))
        (sms ?ilesms)
        (mms 0)))
)


; ============================================
; rozmowy w swojej sieci
; smsy w roznych
; ============================================
(defrule wyk-rozm-5-Orange
    (answer (key NETWORK) (value Orange))

    (answer (key CALLNETWORK) (value self))
    (answer (key CALLCOUNT) (value ?ile))
    (answer (key CALLLENGTH) (value ?dlugosc))

    (answer (key SMSNETWORK) (value various))
    (answer (key SMSCOUNT) (value ?ilesms))
=>
    (assert (doWykonania (siec_docelowa Orange)
        (min (* ?ile ?dlugosc))
        (sms (* ?ilesms 0.2))
        (mms 0)))
)

(defrule wyk-rozm-5-Plus
    (answer (key NETWORK) (value Plus))

    (answer (key CALLNETWORK) (value self))
    (answer (key CALLCOUNT) (value ?ile))
    (answer (key CALLLENGTH) (value ?dlugosc))

    (answer (key SMSNETWORK) (value various))
    (answer (key SMSCOUNT) (value ?ilesms))
=>
    (assert (doWykonania (siec_docelowa Plus)
        (min 0)
        (sms (* ?ilesms 0.2))
        (mms 0)))
)

(defrule wyk-rozm-5-Heyah
    (answer (key NETWORK) (value Heyah))

    (answer (key CALLNETWORK) (value self))
    (answer (key CALLCOUNT) (value ?ile))
    (answer (key CALLLENGTH) (value ?dlugosc))

    (answer (key SMSNETWORK) (value various))
    (answer (key SMSCOUNT) (value ?ilesms))
=>
    (assert (doWykonania (siec_docelowa Heyah)
        (min 0)
        (sms (* ?ilesms 0.2))
        (mms 0)))
)

(defrule wyk-rozm-5-Play
    (answer (key NETWORK) (value Play))

    (answer (key CALLNETWORK) (value self))
    (answer (key CALLCOUNT) (value ?ile))
    (answer (key CALLLENGTH) (value ?dlugosc))

    (answer (key SMSNETWORK) (value various))
    (answer (key SMSCOUNT) (value ?ilesms))
=>
    (assert (doWykonania (siec_docelowa Play)
        (min 0)
        (sms (* ?ilesms 0.2))
        (mms 0)))
)

(defrule wyk-rozm-5-TMobile
    (answer (key NETWORK) (value Tmobile))

    (answer (key CALLNETWORK) (value self))
    (answer (key CALLCOUNT) (value ?ile))
    (answer (key CALLLENGTH) (value ?dlugosc))

    (answer (key SMSNETWORK) (value various))
    (answer (key SMSCOUNT) (value ?ilesms))
=>
    (assert (doWykonania (siec_docelowa Tmobile)
        (min 0)
        (sms (* ?ilesms 0.2))
        (mms 0)))
)






; ============================================
; rozmowy w roznych sieciach ale nie play
; smsy w swojej sieci
; ============================================

(defrule wyk-rozm-2-Orange
    (answer (key NETWORK) (value Orange))

    (answer (key CALLNETWORK) (value various_not_play))
    (answer (key CALLCOUNT) (value ?ile))
    (answer (key CALLLENGTH) (value ?dlugosc))

    (answer (key SMSNETWORK) (value self))
    (answer (key SMSCOUNT) (value ?ilesms))
=>
    (assert (doWykonania (siec_docelowa Orange)
        (min (* (* ?ile ?dlugosc) 0.25))
        (sms ?ilesms)
        (mms 0)))

    (assert (doWykonania (siec_docelowa Plus)
        (min (* (* ?ile ?dlugosc) 0.25))
        (sms 0)
        (mms 0)))

    (assert (doWykonania (siec_docelowa Tmobile)
        (min (* (* ?ile ?dlugosc) 0.25))
        (sms 0)
        (mms 0)))

    (assert (doWykonania (siec_docelowa Heyah)
        (min (* (* ?ile ?dlugosc) 0.25))
        (sms 0)
        (mms 0)))
)

(defrule wyk-rozm-2-Tmobile
    (answer (key NETWORK) (value Tmobile))

    (answer (key CALLNETWORK) (value various_not_play))
    (answer (key CALLCOUNT) (value ?ile))
    (answer (key CALLLENGTH) (value ?dlugosc))

    (answer (key SMSNETWORK) (value self))
    (answer (key SMSCOUNT) (value ?ilesms))
=>
    (assert (doWykonania (siec_docelowa Orange)
        (min (* (* ?ile ?dlugosc) 0.25))
        (sms 0)
        (mms 0)))

    (assert (doWykonania (siec_docelowa Plus)
        (min (* (* ?ile ?dlugosc) 0.25))
        (sms 0)
        (mms 0)))

    (assert (doWykonania (siec_docelowa Tmobile)
        (min (* (* ?ile ?dlugosc) 0.25))
        (sms ?ilesms)
        (mms 0)))

    (assert (doWykonania (siec_docelowa Heyah)
        (min (* (* ?ile ?dlugosc) 0.25))
        (sms 0)
        (mms 0)))
)

(defrule wyk-rozm-2-Heyah
    (answer (key NETWORK) (value Heyah))

    (answer (key CALLNETWORK) (value various_not_play))
    (answer (key CALLCOUNT) (value ?ile))
    (answer (key CALLLENGTH) (value ?dlugosc))

    (answer (key SMSNETWORK) (value self))
    (answer (key SMSCOUNT) (value ?ilesms))
=>
    (assert (doWykonania (siec_docelowa Orange)
        (min (* (* ?ile ?dlugosc) 0.25))
        (sms 0)
        (mms 0)))

    (assert (doWykonania (siec_docelowa Plus)
        (min (* (* ?ile ?dlugosc) 0.25))
        (sms 0)
        (mms 0)))

    (assert (doWykonania (siec_docelowa Tmobile)
        (min (* (* ?ile ?dlugosc) 0.25))
        (sms 0)
        (mms 0)))

    (assert (doWykonania (siec_docelowa Heyah)
        (min (* (* ?ile ?dlugosc) 0.25))
        (sms ?ilesms)
        (mms 0)))
)

(defrule wyk-rozm-2-Plus
    (answer (key NETWORK) (value Plus))

    (answer (key CALLNETWORK) (value various_not_play))
    (answer (key CALLCOUNT) (value ?ile))
    (answer (key CALLLENGTH) (value ?dlugosc))

    (answer (key SMSNETWORK) (value self))
    (answer (key SMSCOUNT) (value ?ilesms))
=>
    (assert (doWykonania (siec_docelowa Orange)
        (min (* (* ?ile ?dlugosc) 0.25))
        (sms 0)
        (mms 0)))

    (assert (doWykonania (siec_docelowa Plus)
        (min (* (* ?ile ?dlugosc) 0.25))
        (sms 0)
        (mms 0)))

    (assert (doWykonania (siec_docelowa Tmobile)
        (min (* (* ?ile ?dlugosc) 0.25))
        (sms 0)
        (mms 0)))

    (assert (doWykonania (siec_docelowa Heyah)
        (min (* (* ?ile ?dlugosc) 0.25))
        (sms ?ilesms)
        (mms 0)))
)




; ============================================
; rozmowy w roznych sieciach ale nie play
; smsy do roznych
; ============================================

(defrule wyk-rozm-6-Orange
    (answer (key NETWORK) (value Orange))

    (answer (key CALLNETWORK) (value various_not_play))
    (answer (key CALLCOUNT) (value ?ile))
    (answer (key CALLLENGTH) (value ?dlugosc))

    (answer (key SMSNETWORK) (value various))
    (answer (key SMSCOUNT) (value ?ilesms))
=>
    (assert (doWykonania (siec_docelowa Orange)
        (min (* (* ?ile ?dlugosc) 0.25))
        (sms (* ?ilesms 0.2))
        (mms 0)))

    (assert (doWykonania (siec_docelowa Plus)
        (min (* (* ?ile ?dlugosc) 0.25))
        (sms (* ?ilesms 0.2))
        (mms 0)))

    (assert (doWykonania (siec_docelowa Tmobile)
        (min (* (* ?ile ?dlugosc) 0.25))
        (sms (* ?ilesms 0.2))
        (mms 0)))

    (assert (doWykonania (siec_docelowa Heyah)
        (min (* (* ?ile ?dlugosc) 0.25))
        (sms (* ?ilesms 0.2))
        (mms 0)))

    (assert (doWykonania (siec_docelowa Play)
        (min 0)
        (sms (* ?ilesms 0.2))
        (mms 0)))
)

(defrule wyk-rozm-6-Tmobile
    (answer (key NETWORK) (value Tmobile))

    (answer (key CALLNETWORK) (value various_not_play))
    (answer (key CALLCOUNT) (value ?ile))
    (answer (key CALLLENGTH) (value ?dlugosc))

    (answer (key SMSNETWORK) (value various))
    (answer (key SMSCOUNT) (value ?ilesms))
=>
    (assert (doWykonania (siec_docelowa Orange)
        (min (* (* ?ile ?dlugosc) 0.25))
        (sms (* ?ilesms 0.2))
        (mms 0)))

    (assert (doWykonania (siec_docelowa Plus)
        (min (* (* ?ile ?dlugosc) 0.25))
        (sms (* ?ilesms 0.2))
        (mms 0)))

    (assert (doWykonania (siec_docelowa Tmobile)
        (min (* (* ?ile ?dlugosc) 0.25))
        (sms (* ?ilesms 0.2))
        (mms 0)))

    (assert (doWykonania (siec_docelowa Heyah)
        (min (* (* ?ile ?dlugosc) 0.25))
        (sms (* ?ilesms 0.2))
        (mms 0)))

    (assert (doWykonania (siec_docelowa Play)
        (min 0)
        (sms (* ?ilesms 0.2))
        (mms 0)))
)

(defrule wyk-rozm-6-Heyah
    (answer (key NETWORK) (value Heyah))

    (answer (key CALLNETWORK) (value various_not_play))
    (answer (key CALLCOUNT) (value ?ile))
    (answer (key CALLLENGTH) (value ?dlugosc))

    (answer (key SMSNETWORK) (value various))
    (answer (key SMSCOUNT) (value ?ilesms))
=>
    (assert (doWykonania (siec_docelowa Orange)
        (min (* (* ?ile ?dlugosc) 0.25))
        (sms (* ?ilesms 0.2))
        (mms 0)))

    (assert (doWykonania (siec_docelowa Plus)
        (min (* (* ?ile ?dlugosc) 0.25))
        (sms (* ?ilesms 0.2))
        (mms 0)))

    (assert (doWykonania (siec_docelowa Tmobile)
        (min (* (* ?ile ?dlugosc) 0.25))
        (sms (* ?ilesms 0.2))
        (mms 0)))

    (assert (doWykonania (siec_docelowa Heyah)
        (min (* (* ?ile ?dlugosc) 0.25))
        (sms (* ?ilesms 0.2))
        (mms 0)))

    (assert (doWykonania (siec_docelowa Play)
        (min 0)
        (sms (* ?ilesms 0.2))
        (mms 0)))
)

(defrule wyk-rozm-6-Plus
    (answer (key NETWORK) (value Plus))

    (answer (key CALLNETWORK) (value various_not_play))
    (answer (key CALLCOUNT) (value ?ile))
    (answer (key CALLLENGTH) (value ?dlugosc))

    (answer (key SMSNETWORK) (value various))
    (answer (key SMSCOUNT) (value ?ilesms))
=>
    (assert (doWykonania (siec_docelowa Orange)
        (min (* (* ?ile ?dlugosc) 0.25))
        (sms (* ?ilesms 0.2))
        (mms 0)))

    (assert (doWykonania (siec_docelowa Plus)
        (min (* (* ?ile ?dlugosc) 0.25))
        (sms (* ?ilesms 0.2))
        (mms 0)))

    (assert (doWykonania (siec_docelowa Tmobile)
        (min (* (* ?ile ?dlugosc) 0.25))
        (sms (* ?ilesms 0.2))
        (mms 0)))

    (assert (doWykonania (siec_docelowa Heyah)
        (min (* (* ?ile ?dlugosc) 0.25))
        (sms (* ?ilesms 0.2))
        (mms 0)))

    (assert (doWykonania (siec_docelowa Play)
        (min 0)
        (sms (* ?ilesms 0.2))
        (mms 0)))
)


(defrule wyk-rozm-6-Plus
    (answer (key NETWORK) (value Plus))

    (answer (key CALLNETWORK) (value various_not_play))
    (answer (key CALLCOUNT) (value ?ile))
    (answer (key CALLLENGTH) (value ?dlugosc))

    (answer (key SMSNETWORK) (value various))
    (answer (key SMSCOUNT) (value ?ilesms))
=>
    (assert (doWykonania (siec_docelowa Orange)
        (min (* (* ?ile ?dlugosc) 0.25))
        (sms (* ?ilesms 0.2))
        (mms 0)))

    (assert (doWykonania (siec_docelowa Plus)
        (min (* (* ?ile ?dlugosc) 0.25))
        (sms (* ?ilesms 0.2))
        (mms 0)))

    (assert (doWykonania (siec_docelowa Tmobile)
        (min (* (* ?ile ?dlugosc) 0.25))
        (sms (* ?ilesms 0.2))
        (mms 0)))

    (assert (doWykonania (siec_docelowa Heyah)
        (min (* (* ?ile ?dlugosc) 0.25))
        (sms (* ?ilesms 0.2))
        (mms 0)))

    (assert (doWykonania (siec_docelowa Play)
        (min 0)
        (sms (* ?ilesms 0.2))
        (mms 0)))
)




; ============================================
; rozmowy w roznych sieciach, rowniez play
; smsy w swojej sieci
; ============================================
(defrule wyk-rozm-3-Orange
    (answer (key NETWORK) (value Orange))

    (answer (key CALLNETWORK) (value various_inc_play))
    (answer (key CALLCOUNT) (value ?ile))
    (answer (key CALLLENGTH) (value ?dlugosc))

    (answer (key SMSNETWORK) (value self))
    (answer (key SMSCOUNT) (value ?ilesms))
=>
    (assert (doWykonania (siec_docelowa Orange)
        (min (* (* ?ile ?dlugosc) 0.2))
        (sms ?ilesms)
        (mms 0)))

    (assert (doWykonania (siec_docelowa Plus)
        (min (* (* ?ile ?dlugosc) 0.2))
        (sms 0)
        (mms 0)))

    (assert (doWykonania (siec_docelowa Tmobile)
        (min (* (* ?ile ?dlugosc) 0.2))
        (sms 0)
        (mms 0)))

    (assert (doWykonania (siec_docelowa Heyah)
        (min (* (* ?ile ?dlugosc) 0.2))
        (sms 0)
        (mms 0)))

    (assert (doWykonania (siec_docelowa Play)
        (min (* (* ?ile ?dlugosc) 0.2))
        (sms 0)
        (mms 0)))
)

(defrule wyk-rozm-3-Tmobile
    (answer (key NETWORK) (value Tmobile))

    (answer (key CALLNETWORK) (value various_inc_play))
    (answer (key CALLCOUNT) (value ?ile))
    (answer (key CALLLENGTH) (value ?dlugosc))

    (answer (key SMSNETWORK) (value self))
    (answer (key SMSCOUNT) (value ?ilesms))
=>
    (assert (doWykonania (siec_docelowa Orange)
        (min (* (* ?ile ?dlugosc) 0.2))
        (sms 0)
        (mms 0)))

    (assert (doWykonania (siec_docelowa Plus)
        (min (* (* ?ile ?dlugosc) 0.2))
        (sms 0)
        (mms 0)))

    (assert (doWykonania (siec_docelowa Tmobile)
        (min (* (* ?ile ?dlugosc) 0.2))
        (sms ?ilesms)
        (mms 0)))

    (assert (doWykonania (siec_docelowa Heyah)
        (min (* (* ?ile ?dlugosc) 0.2))
        (sms 0)
        (mms 0)))

    (assert (doWykonania (siec_docelowa Play)
        (min (* (* ?ile ?dlugosc) 0.2))
        (sms 0)
        (mms 0)))
)

(defrule wyk-rozm-3-Plus
    (answer (key NETWORK) (value Plus))

    (answer (key CALLNETWORK) (value various_inc_play))
    (answer (key CALLCOUNT) (value ?ile))
    (answer (key CALLLENGTH) (value ?dlugosc))

    (answer (key SMSNETWORK) (value self))
    (answer (key SMSCOUNT) (value ?ilesms))
=>
    (assert (doWykonania (siec_docelowa Orange)
        (min (* (* ?ile ?dlugosc) 0.2))
        (sms 0)
        (mms 0)))

    (assert (doWykonania (siec_docelowa Plus)
        (min (* (* ?ile ?dlugosc) 0.2))
        (sms ?ilesms)
        (mms 0)))

    (assert (doWykonania (siec_docelowa Tmobile)
        (min (* (* ?ile ?dlugosc) 0.2))
        (sms 0)
        (mms 0)))

    (assert (doWykonania (siec_docelowa Heyah)
        (min (* (* ?ile ?dlugosc) 0.2))
        (sms 0)
        (mms 0)))

    (assert (doWykonania (siec_docelowa Play)
        (min (* (* ?ile ?dlugosc) 0.2))
        (sms 0)
        (mms 0)))
)

(defrule wyk-rozm-3-Play
    (answer (key NETWORK) (value Play))

    (answer (key CALLNETWORK) (value various_inc_play))
    (answer (key CALLCOUNT) (value ?ile))
    (answer (key CALLLENGTH) (value ?dlugosc))

    (answer (key SMSNETWORK) (value self))
    (answer (key SMSCOUNT) (value ?ilesms))
=>
    (assert (doWykonania (siec_docelowa Orange)
        (min (* (* ?ile ?dlugosc) 0.2))
        (sms 0)
        (mms 0)))

    (assert (doWykonania (siec_docelowa Plus)
        (min (* (* ?ile ?dlugosc) 0.2))
        (sms 0)
        (mms 0)))

    (assert (doWykonania (siec_docelowa Tmobile)
        (min (* (* ?ile ?dlugosc) 0.2))
        (sms 0)
        (mms 0)))

    (assert (doWykonania (siec_docelowa Heyah)
        (min (* (* ?ile ?dlugosc) 0.2))
        (sms 0)
        (mms 0)))

    (assert (doWykonania (siec_docelowa Play)
        (min (* (* ?ile ?dlugosc) 0.2))
        (sms ?ilesms)
        (mms 0)))
)

(defrule wyk-rozm-3-Heyah
    (answer (key NETWORK) (value Heyah))

    (answer (key CALLNETWORK) (value various_inc_play))
    (answer (key CALLCOUNT) (value ?ile))
    (answer (key CALLLENGTH) (value ?dlugosc))

    (answer (key SMSNETWORK) (value self))
    (answer (key SMSCOUNT) (value ?ilesms))
=>
    (assert (doWykonania (siec_docelowa Orange)
        (min (* (* ?ile ?dlugosc) 0.2))
        (sms 0)
        (mms 0)))

    (assert (doWykonania (siec_docelowa Plus)
        (min (* (* ?ile ?dlugosc) 0.2))
        (sms 0)
        (mms 0)))

    (assert (doWykonania (siec_docelowa Tmobile)
        (min (* (* ?ile ?dlugosc) 0.2))
        (sms 0)
        (mms 0)))

    (assert (doWykonania (siec_docelowa Heyah)
        (min (* (* ?ile ?dlugosc) 0.2))
        (sms ?ilesms)
        (mms 0)))

    (assert (doWykonania (siec_docelowa Play)
        (min (* (* ?ile ?dlugosc) 0.2))
        (sms 0)
        (mms 0)))
)

; ============================================
; pakiety internetowe
; ============================================

(defrule net
    (answer (key NETPACKETS) (value true))
    (answer (key NETUSAGE) (value ?v))
=>
        (assert (doWykonania (net ?v)))
)
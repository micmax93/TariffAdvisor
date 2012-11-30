
; Reguly produkcji
; Tworzenie zestawow bez pakietow
(defrule init-zestaw
	(taryfa
		(nazwa ?t)
		(siec ?siec)
	)
	(answer (key NETWORK) (value ?siec))
	(doladowania
		(taryfa $? ?t $?)
		(cena ?c)
		(bonus ?b)
		(waznosc ?w)
	)
	(answer (key MAXCOST) (value ?cmax))
	(test (<= ?c ?cmax))
	=>
	(assert
		(zestaw
			(taryfa ?t)
			(pakiety)
			(cena ?c)
			(srodki =(+ ?c ?b))
		)
	)
)

(defrule init-darmowe
	(zestaw
		(taryfa ?t)
		(pakiety)
		(cena ?c)
		(wykMin)
		(wykSms)
		(wykMms)
		(wykNet)
	)
	(not
		(bonus
			(taryfa ?t)
			(cena ?c)
		)
	)
	=>
	(assert
		(darmowe
			(taryfa ?t)
			(pakiety)
			(cena ?c)
			(cel wsieci)
		)
		(darmowe
			(taryfa ?t)
			(pakiety)
			(cena ?c)
			(cel wszyscy)
		)
	)
)

(defrule load-darmowe
	(zestaw
		(taryfa ?t)
		(pakiety)
		(cena ?c)
		(wykMin)
		(wykSms)
		(wykMms)
		(wykNet)
	)
	(bonus
		(taryfa ?t)
		(cena ?c)
		(min ?min)
		(sms ?sms)
		(net ?net)
	)
	=>
	(assert
		(darmowe
			(taryfa ?t)
			(pakiety)
			(cena ?c)
			(min ?min)
			(sms ?sms)
			(net ?net)
			(cel wsieci)
		)
		(darmowe
			(taryfa ?t)
			(pakiety)
			(cena ?c)
			(cel wszyscy)
		)
	)
)

; Dodawanie pakietow do zestawow
(defrule dodaj-pakietMin
	(answer (key CALLPACKETS) (value true))
	(zestaw
		(taryfa ?t)
		(pakiety)
		(cena ?c)
		(srodki ?s)
		(wykMin)
		(wykSms)
		(wykMms)
		(wykNet)
	)
	(taryfa
		(nazwa ?t)
		(siec ?sc)
	)
	(pakietMinut
		(nazwa ?p)
		(taryfa $? nd|?t $?)
		(siec nd|?sc)
		(cena ?cp)
	)
	(test (< ?cp ?s))
	=>
	(assert
		(zestaw
			(taryfa ?t)
			(pakiety ?p)
			(cena ?c)
			(srodki =(- ?s ?cp))
		)
	)
)


(defrule dodaj-pakietSms
	(answer (key SMSPACKETS) (value true))
	(zestaw
		(taryfa ?t)
		(pakiety)
		(cena ?c)
		(srodki ?s)
		(wykMin)
		(wykSms)
		(wykMms)
		(wykNet)
	)
	(taryfa
		(nazwa ?t)
		(siec ?sc)
	)
	(pakietSMS
		(nazwa ?p)
		(taryfa $? nd|?t $?)
		(siec nd|?sc)
		(cena ?cp)
	)
	(test (< ?cp ?s))
	=>
	(assert
		(zestaw
			(taryfa ?t)
			(pakiety ?p)
			(cena ?c)
			(srodki =(- ?s ?cp))
		)
	)
)


(defrule dodaj-pakietMms
	(zestaw
		(taryfa ?t)
		(pakiety)
		(cena ?c)
		(srodki ?s)
		(wykMin)
		(wykSms)
		(wykMms)
		(wykNet)
	)
	(taryfa
		(nazwa ?t)
		(siec ?sc)
	)
	(pakietMMS
		(nazwa ?p)
		(taryfa $? nd|?t $?)
		(siec nd|?sc)
		(cena ?cp)
	)
	(test (< ?cp ?s))
	=>
	(assert
		(zestaw
			(taryfa ?t)
			(pakiety ?p)
			(cena ?c)
			(srodki =(- ?s ?cp))
		)
	)
)


(defrule dodaj-pakietNet
	(answer (key CALLPACKETS) (value true))
	(zestaw
		(taryfa ?t)
		(pakiety)
		(cena ?c)
		(srodki ?s)
		(wykMin)
		(wykSms)
		(wykMms)
		(wykNet)
	)
	(taryfa
		(nazwa ?t)
		(siec ?sc)
	)
	(pakietNet
		(nazwa ?p)
		(taryfa $? nd|?t $?)
		(siec nd|?sc)
		(cena ?cp)
	)
	(test (< ?cp ?s))
	=>
	(assert
		(zestaw
			(taryfa ?t)
			(pakiety ?p)
			(cena ?c)
			(srodki =(- ?s ?cp))
		)
	)
)


(defrule dodaj-pakietNum
	(zestaw
		(taryfa ?t)
		(pakiety)
		(cena ?c)
		(srodki ?s)
		(wykMin)
		(wykSms)
		(wykMms)
		(wykNet)
	)
	(taryfa
		(nazwa ?t)
		(siec ?sc)
	)
	(pakietNumer
		(nazwa ?p)
		(taryfa $? nd|?t $?)
		(siec nd|?sc)
		(cena ?cp)
	)
	(test (< ?cp ?s))
	=>
	(assert
		(zestaw
			(taryfa ?t)
			(pakiety ?p)
			(cena ?c)
			(srodki =(- ?s ?cp))
		)
	)
)




; Wyliczanie darmowych
(defrule load-PakietMin
	(zestaw
		(taryfa ?t)
		(pakiety $? ?p $?)
		(cena ?c)
		(wykMin)
		(wykSms)
		(wykMms)
		(wykNet)
	)
	(pakietMinut
		(nazwa ?p)
		(typ darmowe)
		(min ?pm)
		(cel ?s)
	)
	(darmowe
		(taryfa ?t)
		(pakiety)
		(min ?min)
		(sms ?sms)
		(mms ?mms)
		(net ?net)
		(cel ?s)
		(cena ?c)
	)
	=>
	(assert
		(darmowe
			(taryfa ?t)
			(pakiety ?p)
			(min =(+ ?min ?pm))
			(sms ?sms)
			(mms ?mms)
			(net ?net)
			(cel ?s)
			(cena ?c)
		)
	)
)

(defrule load-PakietSms
	(zestaw
		(taryfa ?t)
		(pakiety $? ?p $?)
		(cena ?c)
		(wykMin)
		(wykSms)
		(wykMms)
		(wykNet)
	)
	(pakietSMS
		(nazwa ?p)
		(typ darmowe)
		(sms ?ps)
		(cel ?s)
	)
	(darmowe
		(taryfa ?t)
		(pakiety)
		(min ?min)
		(sms ?sms)
		(mms ?mms)
		(net ?net)
		(cel ?s)
		(cena ?c)
	)
	=>
	(assert
		(darmowe
			(taryfa ?t)
			(pakiety ?p)
			(min ?min)
			(sms =(+ ?sms ?ps))
			(mms ?mms)
			(net ?net)
			(cel ?s)
			(cena ?c)
		)
	)
)

(defrule load-PakietMms
	(zestaw
		(taryfa ?t)
		(pakiety $? ?p $?)
		(cena ?c)
		(wykMin)
		(wykSms)
		(wykMms)
		(wykNet)
	)
	(pakietMMS
		(nazwa ?p)
		(typ darmowe)
		(mms ?ps)
		(cel ?s)
	)
	(darmowe
		(taryfa ?t)
		(pakiety)
		(min ?min)
		(sms ?sms)
		(mms ?mms)
		(net ?net)
		(cel ?s)
		(cena ?c)
	)
	=>
	(assert
		(darmowe
			(taryfa ?t)
			(pakiety ?p)
			(min ?min)
			(mms =(+ ?mms ?ps))
			(sms ?sms)
			(net ?net)
			(cel ?s)
			(cena ?c)
		)
	)
)



(defrule load-PakietNet
	(zestaw
		(taryfa ?t)
		(pakiety $? ?p $?)
		(cena ?c)
		(wykMin)
		(wykSms)
		(wykMms)
		(wykNet)
	)
	(pakietNet
		(nazwa ?p)
		(typ darmowe)
		(net ?pn)
	)
	(darmowe
		(taryfa ?t)
		(pakiety)
		(min ?min)
		(sms ?sms)
		(mms ?mms)
		(net ?net)
		(cel wsieci)
		(cena ?c)
	)
	=>
	(assert
		(darmowe
			(taryfa ?t)
			(pakiety ?p)
			(min ?min)
			(sms ?sms)
			(mms ?mms)
			(net =(+ ?net ?pn))
			(cel wsieci)
			(cena ?c)
		)
	)
)



(defrule load-darmoweWsieci
	(zestaw
		(taryfa ?t)
		(pakiety $? ?p $?)
		(cena ?c)
		(wykMin)
		(wykSms)
		(wykMms)
		(wykNet)
	)
	(not (pakietMinut
		(nazwa ?p)
		(typ darmowe)
		(cel wsieci)
	))
	(not (pakietSMS
		(nazwa ?p)
		(typ darmowe)
		(cel wsieci)
	))
	(not (pakietMMS
		(nazwa ?p)
		(typ darmowe)
		(cel wsieci)
	))
	(not (pakietNet
		(nazwa ?p)
		(typ darmowe)
	))
	(darmowe
		(taryfa ?t)
		(pakiety)
		(min ?min)
		(sms ?sms)
		(mms ?mms)
		(net ?net)
		(cel wsieci)
		(cena ?c)
	)
	=>
	(assert
		(darmowe
			(taryfa ?t)
			(pakiety ?p)
			(min ?min)
			(sms ?sms)
			(mms ?mms)
			(net ?net)
			(cel wsieci)
			(cena ?c)
		)
	)
)


(defrule load-damoweWszyscy
	(zestaw
		(taryfa ?t)
		(pakiety $? ?p $?)
		(cena ?c)
		(wykMin)
		(wykSms)
		(wykMms)
		(wykNet)
	)
	(not (pakietMinut
		(nazwa ?p)
		(typ darmowe)
		(cel wszyscy)
	))
	(not (pakietSMS
		(nazwa ?p)
		(typ darmowe)
		(cel wszyscy)
	))
	(not (pakietMMS
		(nazwa ?p)
		(typ darmowe)
		(cel wszyscy)
	))
	(darmowe
		(taryfa ?t)
		(pakiety)
		(min ?min)
		(sms ?sms)
		(mms ?mms)
		(net ?net)
		(cel wszyscy)
		(cena ?c)
	)
	=>
	(assert
		(darmowe
			(taryfa ?t)
			(pakiety ?p)
			(min ?min)
			(sms ?sms)
			(mms ?mms)
			(net ?net)
			(cel wszyscy)
			(cena ?c)
		)
	)
)


;Oblicznie cennikow
;do wszystkich
(defrule load-cenaMin
	(zestaw
		(taryfa ?t)
		(pakiety $? ?p $?)
		(wykMin)
		(wykSms)
		(wykMms)
		(wykNet)
	)
	(pakietMinut
		(nazwa ?p)
		(typ cena)
		(min ?c)
		(cel wszyscy)
	)
	(cennik
		(taryfa ?t)
		(siec_docelowa $?sc)
		(pakiety)
		(min ?min)
		(sms ?sms)
		(mms ?mms)
	)
	=>
	(assert
		(cennik
			(taryfa ?t)
			(siec_docelowa $?sc)
			(pakiety ?p)
			(min ?c)
			(sms ?sms)
			(mms ?mms)
		)
	)
)


(defrule load-cenaSms
	(zestaw
		(taryfa ?t)
		(pakiety $? ?p $?)
		(wykMin)
		(wykSms)
		(wykMms)
		(wykNet)
	)
	(pakietSMS
		(nazwa ?p)
		(typ cena)
		(sms ?c)
		(cel wszyscy)
	)
	(cennik
		(taryfa ?t)
		(siec_docelowa $?sc)
		(pakiety)
		(min ?min)
		(sms ?sms)
		(mms ?mms)
	)
	=>
	(assert
		(cennik
			(taryfa ?t)
			(siec_docelowa $?sc)
			(pakiety ?p)
			(min ?min)
			(sms ?c)
			(mms ?mms)
		)
	)
)


(defrule load-cenaMms
	(zestaw
		(taryfa ?t)
		(pakiety $? ?p $?)
		(wykMin)
		(wykSms)
		(wykMms)
		(wykNet)
	)
	(pakietMMS
		(nazwa ?p)
		(typ cena)
		(mms ?c)
		(cel wszyscy)
	)
	(cennik
		(taryfa ?t)
		(siec_docelowa $?sc)
		(pakiety)
		(min ?min)
		(sms ?sms)
		(mms ?mms)
	)
	=>
	(assert
		(cennik
			(taryfa ?t)
			(siec_docelowa $?sc)
			(pakiety ?p)
			(min ?min)
			(sms ?sms)
			(mms ?c)
		)
	)
)


;do sieci
(defrule load-cenaMinS
	(zestaw
		(taryfa ?t)
		(pakiety $? ?p $?)
		(wykMin)
		(wykSms)
		(wykMms)
		(wykNet)
	)
	(pakietMinut
		(nazwa ?p)
		(typ cena)
		(min ?c)
		(cel wsieci)
	)
	(taryfa
		(nazwa ?t)
		(siec ?siec)
	)
	(cennik
		(taryfa ?t)
		(siec_docelowa $?x ?siec $?y)
		(pakiety)
		(min ?min)
		(sms ?sms)
		(mms ?mms)
	)
	=>
	(assert
		(cennik
			(taryfa ?t)
			(siec_docelowa ?siec)
			(pakiety ?p)
			(min ?c)
			(sms ?sms)
			(mms ?mms)
		)
		(cennik
			(taryfa ?t)
			(siec_docelowa $?x $?y)
			(pakiety ?p)
			(min ?min)
			(sms ?sms)
			(mms ?mms)
		)
	)
)

(defrule load-cenaSmsS
	(zestaw
		(taryfa ?t)
		(pakiety $? ?p $?)
		(wykMin)
		(wykSms)
		(wykMms)
		(wykNet)
	)
	(pakietSMS
		(nazwa ?p)
		(typ cena)
		(sms ?c)
		(cel wsieci)
	)
	(taryfa
		(nazwa ?t)
		(siec ?siec)
	)
	(cennik
		(taryfa ?t)
		(siec_docelowa $?x ?siec $?y)
		(pakiety)
		(min ?min)
		(sms ?sms)
		(mms ?mms)
	)
	=>
	(assert
		(cennik
			(taryfa ?t)
			(siec_docelowa ?siec)
			(pakiety ?p)
			(min ?min)
			(sms ?c)
			(mms ?mms)
		)
		(cennik
			(taryfa ?t)
			(siec_docelowa $?x $?y)
			(pakiety ?p)
			(min ?min)
			(sms ?sms)
			(mms ?mms)
		)
	)
)

(defrule load-cenaMmsS
	(zestaw
		(taryfa ?t)
		(pakiety $? ?p $?)
		(wykMin)
		(wykSms)
		(wykMms)
		(wykNet)
	)
	(pakietMMS
		(nazwa ?p)
		(typ cena)
		(mms ?c)
		(cel wsieci)
	)
	(taryfa
		(nazwa ?t)
		(siec ?siec)
	)
	(cennik
		(taryfa ?t)
		(siec_docelowa $?x ?siec $?y)
		(pakiety)
		(min ?min)
		(sms ?sms)
		(mms ?mms)
	)
	=>
	(assert
		(cennik
			(taryfa ?t)
			(siec_docelowa ?siec)
			(pakiety ?p)
			(min ?min)
			(sms ?sms)
			(mms ?c)
		)
		(cennik
			(taryfa ?t)
			(siec_docelowa $?x $?y)
			(pakiety ?p)
			(min ?min)
			(sms ?sms)
			(mms ?mms)
		)
	)
)


;pozostale
(defrule load-cenaRest
	(zestaw
		(taryfa ?t)
		(pakiety $? ?p $?)
		(wykMin)
		(wykSms)
		(wykMms)
		(wykNet)
	)
	(or
		(pakietMinut
			(nazwa ?p)
			(typ cena)
			(cel wsieci)
		)
		(pakietSMS
			(nazwa ?p)
			(typ cena)
			(cel wsieci)
		)
		(pakietMMS
			(nazwa ?p)
			(typ cena)
			(cel wsieci)
		)
	)
	(taryfa
		(nazwa ?t)
		(siec ?siec)
	)
	(cennik
		(taryfa ?t)
		(siec_docelowa $? ?s $?)
		(pakiety)
		(min ?min)
		(sms ?sms)
		(mms ?mms)
	)
	(not (cennik
		(taryfa ?t)
		(siec_docelowa $? ?siec $?)
		(pakiety)
		(min ?min)
		(sms ?sms)
		(mms ?mms)
	))
	=>
	(assert
		(cennik
			(taryfa ?t)
			(siec_docelowa $?s)
			(pakiety ?p)
			(min ?min)
			(sms ?sms)
			(mms ?mms)
		)
	)
)

(defrule load-cenaRestD
	(zestaw
		(taryfa ?t)
		(pakiety $? ?p $?)
		(wykMin)
		(wykSms)
		(wykMms)
		(wykNet)
	)
	(or
		(pakietMinut
			(nazwa ?p)
			(typ darmowe)
		)
		(pakietSMS
			(nazwa ?p)
			(typ darmowe)
		)
		(pakietMMS
			(nazwa ?p)
			(typ darmowe)
		)
	)
	(cennik
		(taryfa ?t)
		(siec_docelowa $?s)
		(pakiety)
		(min ?min)
		(sms ?sms)
		(mms ?mms)
	)
	=>
	(assert
		(cennik
			(taryfa ?t)
			(siec_docelowa $?s)
			(pakiety ?p)
			(min ?min)
			(sms ?sms)
			(mms ?mms)
		)
	)
)

;

;Reguly do operacji w sieci
(defrule wykonajMinWsieciP
	(ui-state (key init-calc) (value true))
	?i1<-(zestaw
		(taryfa ?t)
		(pakiety $?p)
		(cena ?c)
		(srodki ?srodki)
		(wykMin $?wyk)
	)
	(taryfa
		(nazwa ?t)
		(siec ?s)
	)
	(doWykonania
		(siec_docelowa ?s)
		(min ?wm)
	)
	(test (> ?wm 0))
	(not
		(zestaw
			(taryfa ?t)
			(pakiety $?p)
			(cena ?c)
			(srodki ?srodki)
			(wykMin $? ?s $?)
		)
	)
	?i2<-(darmowe
		(taryfa ?t)
		(pakiety $?p)
		(cena ?c)
		(cel wsieci)
		(min ?dm)
	)
	(cennik
		(taryfa ?t)
		(pakiety $?p)
		(siec_docelowa $? ?s $?)
		(min ?cm)
	)
	(test (<= ?dm ?wm))
	=>
	(modify ?i1 (wykMin $?wyk ?s) (srodki (- ?srodki (* 0.01 ?cm (- ?wm ?dm)))))
	(modify ?i2 (min 0))
)

(defrule wykonajMinWsieciD
	(ui-state (key init-calc) (value true))
	?i1<-(zestaw
		(taryfa ?t)
		(pakiety $?p)
		(cena ?c)
		(srodki ?srodki)
		(wykMin $?wyk)
	)
	(taryfa
		(nazwa ?t)
		(siec ?s)
	)
	(doWykonania
		(siec_docelowa ?s)
		(min ?wm)
	)
	(test (> ?wm 0))
	(not
		(zestaw
			(taryfa ?t)
			(pakiety $?p)
			(cena ?c)
			(srodki ?srodki)
			(wykMin $? ?s $?)
		)
	)
	?i2<-(darmowe
		(taryfa ?t)
		(pakiety $?p)
		(cena ?c)
		(cel wsieci)
		(min ?dm)
	)
	(cennik
		(taryfa ?t)
		(pakiety $?p)
		(siec_docelowa $? ?s $?)
		(min ?cm)
	)
	(test (> ?dm ?wm))
	=>
	(modify ?i1 (wykMin $?wyk ?s))
	(modify ?i2 (min (- ?dm ?wm)))
)

(defrule wykonajSmsWsieciP
	(ui-state (key init-calc) (value true))
	?i1<-(zestaw
		(taryfa ?t)
		(pakiety $?p)
		(cena ?c)
		(srodki ?srodki)
		(wykSms $?wyk)
	)
	(taryfa
		(nazwa ?t)
		(siec ?s)
	)
	(doWykonania
		(siec_docelowa ?s)
		(sms ?wm)
	)
	(test (> ?wm 0))
	(not
		(zestaw
			(taryfa ?t)
			(pakiety $?p)
			(cena ?c)
			(srodki ?srodki)
			(wykSms $? ?s $?)
		)
	)
	?i2<-(darmowe
		(taryfa ?t)
		(pakiety $?p)
		(cena ?c)
		(cel wsieci)
		(sms ?dm)
	)
	(cennik
		(taryfa ?t)
		(pakiety $?p)
		(siec_docelowa $? ?s $?)
		(sms ?cm)
	)
	(test (<= ?dm ?wm))
	=>
	(modify ?i1 (wykSms $?wyk ?s) (srodki (- ?srodki (* 0.01 ?cm (- ?wm ?dm)))))
	(modify ?i2 (sms 0))
)

(defrule wykonajSmsWsieciD
	(ui-state (key init-calc) (value true))
	?i1<-(zestaw
		(taryfa ?t)
		(pakiety $?p)
		(cena ?c)
		(srodki ?srodki)
		(wykSms $?wyk)
	)
	(taryfa
		(nazwa ?t)
		(siec ?s)
	)
	(doWykonania
		(siec_docelowa ?s)
		(sms ?wm)
	)
	(test (> ?wm 0))
	(not
		(zestaw
			(taryfa ?t)
			(pakiety $?p)
			(cena ?c)
			(srodki ?srodki)
			(wykSms $? ?s $?)
		)
	)
	?i2<-(darmowe
		(taryfa ?t)
		(pakiety $?p)
		(cena ?c)
		(cel wsieci)
		(sms ?dm)
	)
	(cennik
		(taryfa ?t)
		(pakiety $?p)
		(siec_docelowa $? ?s $?)
		(sms ?cm)
	)
	(test (> ?dm ?wm))
	=>
	(modify ?i1 (wykSms $?wyk ?s))
	(modify ?i2 (sms (- ?dm ?wm)))
)

(defrule wykonajMmsWsieciP
	(ui-state (key init-calc) (value true))
	?i1<-(zestaw
		(taryfa ?t)
		(pakiety $?p)
		(cena ?c)
		(srodki ?srodki)
		(wykMms $?wyk)
	)
	(taryfa
		(nazwa ?t)
		(siec ?s)
	)
	(doWykonania
		(siec_docelowa ?s)
		(mms ?wm)
	)
	(test (> ?wm 0))
	(not
		(zestaw
			(taryfa ?t)
			(pakiety $?p)
			(cena ?c)
			(srodki ?srodki)
			(wykMms $? ?s $?)
		)
	)
	?i2<-(darmowe
		(taryfa ?t)
		(pakiety $?p)
		(cena ?c)
		(cel wsieci)
		(mms ?dm)
	)
	(cennik
		(taryfa ?t)
		(pakiety $?p)
		(siec_docelowa $? ?s $?)
		(mms ?cm)
	)
	(test (<= ?dm ?wm))
	=>
	(modify ?i1 (wykMms $?wyk ?s) (srodki (- ?srodki (* 0.01 ?cm (- ?wm ?dm)))))
	(modify ?i2 (mms 0))
)

(defrule wykonajMmsWsieciD
	(ui-state (key init-calc) (value true))
	?i1<-(zestaw
		(taryfa ?t)
		(pakiety $?p)
		(cena ?c)
		(srodki ?srodki)
		(wykMms $?wyk)
	)
	(taryfa
		(nazwa ?t)
		(siec ?s)
	)
	(doWykonania
		(siec_docelowa ?s)
		(mms ?wm)
	)
	(test (> ?wm 0))
	(not
		(zestaw
			(taryfa ?t)
			(pakiety $?p)
			(cena ?c)
			(srodki ?srodki)
			(wykMms $? ?s $?)
		)
	)
	?i2<-(darmowe
		(taryfa ?t)
		(pakiety $?p)
		(cena ?c)
		(cel wsieci)
		(mms ?dm)
	)
	(cennik
		(taryfa ?t)
		(pakiety $?p)
		(siec_docelowa $? ?s $?)
		(mms ?cm)
	)
	(test (> ?dm ?wm))
	=>
	(modify ?i1 (wykMms $?wyk ?s))
	(modify ?i2 (mms (- ?dm ?wm)))
)



;Reguly do operacji poza siecia
(defrule wykonajMinPozaP
	(ui-state (key init-calc) (value true))
	?i1<-(zestaw
		(taryfa ?t)
		(pakiety $?p)
		(cena ?c)
		(srodki ?srodki)
		(wykMin $?wyk)
	)
	(doWykonania
		(siec_docelowa ?s)
		(min ?wm)
	)
	(test (> ?wm 0))
	(taryfa
		(nazwa ?t)
		(siec ~?s)
	)
	(not
		(zestaw
			(taryfa ?t)
			(pakiety $?p)
			(cena ?c)
			(srodki ?srodki)
			(wykMin $? ?s $?)
		)
	)
	?i2<-(darmowe
		(taryfa ?t)
		(pakiety $?p)
		(cena ?c)
		(cel wszyscy)
		(min ?dm)
	)
	(cennik
		(taryfa ?t)
		(pakiety $?p)
		(siec_docelowa $? ?s $?)
		(min ?cm)
	)
	(test (<= ?dm ?wm))
	=>
	(modify ?i1 (wykMin $?wyk ?s) (srodki (- ?srodki (* 0.01 ?cm (- ?wm ?dm)))))
	(modify ?i2 (min 0))
)

(defrule wykonajMinPozaD
	(ui-state (key init-calc) (value true))
	?i1<-(zestaw
		(taryfa ?t)
		(pakiety $?p)
		(cena ?c)
		(srodki ?srodki)
		(wykMin $?wyk)
	)
	(doWykonania
		(siec_docelowa ?s)
		(min ?wm)
	)
	(test (> ?wm 0))
	(taryfa
		(nazwa ?t)
		(siec ~?s)
	)
	(not
		(zestaw
			(taryfa ?t)
			(pakiety $?p)
			(cena ?c)
			(srodki ?srodki)
			(wykMin $? ?s $?)
		)
	)
	?i2<-(darmowe
		(taryfa ?t)
		(pakiety $?p)
		(cena ?c)
		(cel wszyscy)
		(min ?dm)
	)
	(cennik
		(taryfa ?t)
		(pakiety $?p)
		(siec_docelowa $? ?s $?)
		(min ?cm)
	)
	(test (> ?dm ?wm))
	=>
	(modify ?i1 (wykMin $?wyk ?s))
	(modify ?i2 (min (- ?dm ?wm)))
)

(defrule wykonajSmsPozaP
	(ui-state (key init-calc) (value true))
	?i1<-(zestaw
		(taryfa ?t)
		(pakiety $?p)
		(cena ?c)
		(srodki ?srodki)
		(wykSms $?wyk)
	)
	(doWykonania
		(siec_docelowa ?s)
		(sms ?wm)
	)
	(test (> ?wm 0))
	(taryfa
		(nazwa ?t)
		(siec ~?s)
	)
	(not
		(zestaw
			(taryfa ?t)
			(pakiety $?p)
			(cena ?c)
			(srodki ?srodki)
			(wykSms $? ?s $?)
		)
	)
	?i2<-(darmowe
		(taryfa ?t)
		(pakiety $?p)
		(cena ?c)
		(cel wszyscy)
		(sms ?dm)
	)
	(cennik
		(taryfa ?t)
		(pakiety $?p)
		(siec_docelowa $? ?s $?)
		(sms ?cm)
	)
	(test (<= ?dm ?wm))
	=>
	(modify ?i1 (wykSms $?wyk ?s) (srodki (- ?srodki (* 0.01 ?cm (- ?wm ?dm)))))
	(modify ?i2 (sms 0))
)

(defrule wykonajSmsPozaD
	(ui-state (key init-calc) (value true))
	?i1<-(zestaw
		(taryfa ?t)
		(pakiety $?p)
		(cena ?c)
		(srodki ?srodki)
		(wykSms $?wyk)
	)
	(doWykonania
		(siec_docelowa ?s)
		(sms ?wm)
	)
	(test (> ?wm 0))
	(taryfa
		(nazwa ?t)
		(siec ~?s)
	)
	(not
		(zestaw
			(taryfa ?t)
			(pakiety $?p)
			(cena ?c)
			(srodki ?srodki)
			(wykSms $? ?s $?)
		)
	)
	?i2<-(darmowe
		(taryfa ?t)
		(pakiety $?p)
		(cena ?c)
		(cel wszyscy)
		(sms ?dm)
	)
	(cennik
		(taryfa ?t)
		(pakiety $?p)
		(siec_docelowa $? ?s $?)
		(sms ?cm)
	)
	(test (> ?dm ?wm))
	=>
	(modify ?i1 (wykSms $?wyk ?s))
	(modify ?i2 (sms (- ?dm ?wm)))
)

(defrule wykonajMmsPozaP
	(ui-state (key init-calc) (value true))
	?i1<-(zestaw
		(taryfa ?t)
		(pakiety $?p)
		(cena ?c)
		(srodki ?srodki)
		(wykMms $?wyk)
	)
	(doWykonania
		(siec_docelowa ?s)
		(mms ?wm)
	)
	(test (> ?wm 0))
	(taryfa
		(nazwa ?t)
		(siec ~?s)
	)
	(not
		(zestaw
			(taryfa ?t)
			(pakiety $?p)
			(cena ?c)
			(srodki ?srodki)
			(wykMms $? ?s $?)
		)
	)
	?i2<-(darmowe
		(taryfa ?t)
		(pakiety $?p)
		(cena ?c)
		(cel wszyscy)
		(mms ?dm)
	)
	(cennik
		(taryfa ?t)
		(pakiety $?p)
		(siec_docelowa $? ?s $?)
		(mms ?cm)
	)
	(test (<= ?dm ?wm))
	=>
	(modify ?i1 (wykMms $?wyk ?s) (srodki (- ?srodki (* 0.01 ?cm (- ?wm ?dm)))))
	(modify ?i2 (mms 0))
)

(defrule wykonajMmsPozaD
	(ui-state (key init-calc) (value true))
	?i1<-(zestaw
		(taryfa ?t)
		(pakiety $?p)
		(cena ?c)
		(srodki ?srodki)
		(wykMms $?wyk)
	)
	(doWykonania
		(siec_docelowa ?s)
		(mms ?wm)
	)
	(test (> ?wm 0))
	(taryfa
		(nazwa ?t)
		(siec ~?s)
	)
	(not
		(zestaw
			(taryfa ?t)
			(pakiety $?p)
			(cena ?c)
			(srodki ?srodki)
			(wykMms $? ?s $?)
		)
	)
	?i2<-(darmowe
		(taryfa ?t)
		(pakiety $?p)
		(cena ?c)
		(cel wszyscy)
		(mms ?dm)
	)
	(cennik
		(taryfa ?t)
		(pakiety $?p)
		(siec_docelowa $? ?s $?)
		(mms ?cm)
	)
	(test (> ?dm ?wm))
	=>
	(modify ?i1 (wykMms $?wyk ?s))
	(modify ?i2 (mms (- ?dm ?wm)))
)



;Reguly do wykorzystania lacza
(defrule wykonajNetP
	(ui-state (key init-calc) (value true))
	?i1<-(zestaw
		(taryfa ?t)
		(pakiety $?p)
		(cena ?c)
		(srodki ?srodki)
		(wykNet $?wyk)
	)
	(doWykonania
		(net ?wm)
	)
	(test (> ?wm 0))
	(not
		(zestaw
			(taryfa ?t)
			(pakiety $?p)
			(cena ?c)
			(srodki ?srodki)
			(wykNet $? inet $?)
		)
	)
	?i2<-(darmowe
		(taryfa ?t)
		(pakiety $?p)
		(cena ?c)
		(cel wsieci)
		(net ?dm)
	)
	(transfer
		(taryfa ?t)
		(cena ?cm)
	)
	(test (<= ?dm ?wm))
	=>
	(modify ?i1 (wykNet $?wyk inet) (srodki (- ?srodki (* 100 ?cm (- ?wm ?dm)))))
	(modify ?i2 (net 0))
)

(defrule wykonajNetD
	(ui-state (key init-calc) (value true))
	?i1<-(zestaw
		(taryfa ?t)
		(pakiety $?p)
		(cena ?c)
		(srodki ?srodki)
		(wykNet $?wyk)
	)
	(doWykonania
		(net ?wm)
	)
	(test (> ?wm 0))
	(not
		(zestaw
			(taryfa ?t)
			(pakiety $?p)
			(cena ?c)
			(srodki ?srodki)
			(wykNet $? inet $?)
		)
	)
	?i2<-(darmowe
		(taryfa ?t)
		(pakiety $?p)
		(cena ?c)
		(cel wsieci)
		(net ?dm)
	)
	(transfer
		(taryfa ?t)
		(cena ?cm)
	)
	(test (> ?dm ?wm))
	=>
	(modify ?i1 (wykNet $?wyk inet))
	(modify ?i2 (net (- ?dm ?wm)))
)


;fcelu
(defrule usun-slabe
	(ui-state (key init-calc) (value true))
	?i1<-(zestaw
		(srodki ?s)
	)
	(test (< ?s 0))
	=>
	(retract ?i1)
)


(defrule init-fcelu
	(ui-state (key init-calc) (value true))
	(not (fcelu (wart ?)))
	(zestaw
		(cena ?c)
		(srodki ?s)
	)
	(test (> ?s 0))
	=>
	(assert (fcelu (wart ?c)))
)

(defrule do-fcelu
	(ui-state (key init-calc) (value true))
	?i1<-(fcelu (wart ?f))
	(zestaw
		(cena ?c)
		(srodki ?s)
	)
	(test (> ?s 0))
	(test (< ?c ?f))
	=>
	(retract ?i1)
	(assert (fcelu (wart ?c)))
)

(defrule reset-fcelu
	(ui-state (key init-calc) (value true))
	?i1<-(fcelu (wart ?f))
	(not (zestaw
		(cena ?f)
		(taryfa ?)
		(pakiety $?)
		(srodki ?)
		(wykMin $?)
		(wykSms $?)
		(wykMms $?)
		(wykNet $?)
	))
	=>
	(retract ?i1)
)




(deftemplate taryfa
	(slot	nazwa	(type SYMBOL)	)
	(slot	siec	(type SYMBOL)	)
	(slot	typ		(type SYMBOL)	)
)

(deftemplate cennik
	(slot	taryfa	(type SYMBOL)	)
	(multislot pakiety	(type SYMBOL)	)
	(multislot	siec_docelowa	(type SYMBOL)	)
	(slot	min	(type NUMBER)	)
	(slot	sms	(type NUMBER)	)
	(slot	mms	(type NUMBER)	)
)

(deftemplate transfer
	(slot	taryfa	(type SYMBOL)	)
	(slot	cena	(type NUMBER)	)
)

(deftemplate doladowania
	(multislot	taryfa	(type SYMBOL)	)
	(slot	cena	(type NUMBER)	)
	(slot	bonus	(type NUMBER)	)
	(slot	waznosc	(type NUMBER)	)
)

(deftemplate bonus
	(multislot	taryfa	(type SYMBOL)	)
	(slot	cena	(type NUMBER)	)

	(slot	sms	(type NUMBER)	(default 0)	)
	(slot	min	(type NUMBER)	(default 0)	)
	(slot	net	(type NUMBER)	(default 0)	)
)



(deftemplate pakietMinut
	(slot	nazwa	(type SYMBOL)	)
	(slot	siec	(type SYMBOL)	(default nd))
	(multislot	taryfa	(type SYMBOL)	(default nd))
	(slot	cena	(type NUMBER)	)

	(slot	typ	(allowed-symbols cena darmowe))
	(slot	min	(type NUMBER)	(default 0)	)
	(slot	cel	(allowed-symbols wsieci wszyscy) (default wszyscy))
)

(deftemplate pakietSMS
	(slot	nazwa	(type SYMBOL)	)
	(slot	siec	(type SYMBOL)	(default nd))
	(multislot	taryfa	(type SYMBOL)	(default nd))
	(slot	cena	(type NUMBER)	)

	(slot	typ	(allowed-symbols cena darmowe))
	(slot	sms	(type NUMBER)	(default 0)	)
	(slot	cel	(allowed-symbols wsieci wszyscy) (default wszyscy))
)

(deftemplate pakietMMS
	(slot	nazwa	(type SYMBOL)	)
	(slot	siec	(type SYMBOL)	(default nd))
	(multislot	taryfa	(type SYMBOL)	(default nd))
	(slot	cena	(type NUMBER)	)

	(slot	typ	(allowed-symbols cena darmowe))
	(slot	mms	(type NUMBER)	(default 0)	)
	(slot	cel	(allowed-symbols wsieci wszyscy) (default wszyscy))
)

(deftemplate pakietNet
	(slot	nazwa	(type SYMBOL)	)
	(slot	siec	(type SYMBOL)	(default nd))
	(multislot	taryfa	(type SYMBOL)	(default nd))
	(slot	cena	(type NUMBER)	)

	(slot	typ	(allowed-symbols cena darmowe))
	(slot	net	(type NUMBER)	(default 0)	)
)

(deftemplate pakietNumer
	(slot	nazwa	(type SYMBOL)	)
	(slot	siec	(type SYMBOL)	(default nd))
	(multislot	taryfa	(type SYMBOL)	(default nd))
	(slot	cena	(type NUMBER)	)

	(slot	cel	(allowed-symbols wsieci wszyscy) (default wszyscy))
	(slot	ile	(type NUMBER)	(default 0)	)
	(slot	min	(type NUMBER)	(default 0)	)
)





(deftemplate zestaw
	(slot	taryfa	(type SYMBOL))
	(multislot pakiety (type SYMBOL))
	(slot	cena	(type NUMBER))
	(slot	srodki	(type NUMBER))
)

(deftemplate darmowe
	(slot	taryfa	(type SYMBOL))
	(multislot pakiety (type SYMBOL))
	(slot	cena	(type NUMBER))
	
	(slot	cel	(allowed-symbols wsieci wszyscy) (default wszyscy))
	
	(slot	sms	(type NUMBER)	(default 0)	)
	(slot	mms	(type NUMBER)	(default 0)	)
	(slot	min	(type NUMBER)	(default 0)	)
	(slot	net	(type NUMBER)	(default 0)	)
)



; Reguly produkcji
; Tworzenie zestawow bez pakietow
(defrule init-zestaw
	(taryfa
		(nazwa ?t)
	)
	(doladowania
		(taryfa $? ?t $?)
		(cena ?c)
		(bonus ?b)
		(waznosc ?w)
	)
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
	(zestaw
		(taryfa ?t)
		(pakiety)
		(cena ?c)
		(srodki ?s)
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
	(zestaw
		(taryfa ?t)
		(pakiety)
		(cena ?c)
		(srodki ?s)
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
	(zestaw
		(taryfa ?t)
		(pakiety)
		(cena ?c)
		(srodki ?s)
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
		)
	)
)

(defrule load-PakietSms
	(zestaw
		(taryfa ?t)
		(pakiety $? ?p $?)
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
		)
	)
)

(defrule load-PakietMms
	(zestaw
		(taryfa ?t)
		(pakiety $? ?p $?)
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
		)
	)
)



(defrule load-PakietNet
	(zestaw
		(taryfa ?t)
		(pakiety $? ?p $?)
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
		)
	)
)



(defrule load-darmoweWsieci
	(zestaw
		(taryfa ?t)
		(pakiety $? ?p $?)
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
		)
	)
)


(defrule load-damoweWszyscy
	(zestaw
		(taryfa ?t)
		(pakiety $? ?p $?)
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
		)
	)
)


;Oblicznie cennikow
;do wszystkich
(defrule load-cenaMin
	(zestaw
		(taryfa ?t)
		(pakiety $? ?p $?)
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
	)
	(taryfa
		(nazwa ?t)
		(siec ?siec)
	)
	(pakietMinut
		(nazwa ?p)
		(typ cena)
		(min ?c)
		(cel wsieci)
	)
	(cennik
		(taryfa ?t)
		(siec_docelowa $?s0 ?siec $?s2)
		(pakiety)
		(min ?min)
		(sms ?sms)
		(mms ?mms)
	)
	=>
	(assert
		(cennik
			(taryfa ?t)
			(siec_docelowa $?s0 ?siec $?s2)
			(pakiety ?p)
			(min ?c)
			(sms ?sms)
			(mms ?mms)
		)
	)
)


(defrule load-cenaSmsS
	(zestaw
		(taryfa ?t)
		(pakiety $? ?p $?)
	)
	(taryfa
		(nazwa ?t)
		(siec ?siec)
	)
	(pakietSMS
		(nazwa ?p)
		(typ cena)
		(sms ?c)
		(cel wsieci)
	)
	(cennik
		(taryfa ?t)
		(siec_docelowa $?s0 ?siec $?s2)
		(pakiety)
		(min ?min)
		(sms ?sms)
		(mms ?mms)
	)
	=>
	(assert
		(cennik
			(taryfa ?t)
			(siec_docelowa $?s0 ?siec $?s2)
			(pakiety ?p)
			(min ?min)
			(sms ?c)
			(mms ?mms)
		)
	)
)


(defrule load-cenaMmsS
	(zestaw
		(taryfa ?t)
		(pakiety $? ?p $?)
	)
	(taryfa
		(nazwa ?t)
		(siec ?siec)
	)
	(pakietMMS
		(nazwa ?p)
		(typ cena)
		(mms ?c)
		(cel wsieci)
	)
	(cennik
		(taryfa ?t)
		(siec_docelowa $?s0 ?siec $?s2)
		(pakiety)
		(min ?min)
		(sms ?sms)
		(mms ?mms)
	)
	=>
	(assert
		(cennik
			(taryfa ?t)
			(siec_docelowa $?s0 ?siec $?s2)
			(pakiety ?p)
			(min ?min)
			(sms ?sms)
			(mms ?c)
		)
	)
)

;pozostale
(defrule load-cenaRest
	(zestaw
		(taryfa ?t)
		(pakiety $? ?p $?)
	)
	(taryfa
		(nazwa ?t)
		(siec ?siec)
	)
	(or
		(pakietMinut
			(nazwa ?p)
			(cel wsieci)
		)
		(pakietSMS
			(nazwa ?p)
			(cel wsieci)
		)
		(pakietMMS
			(nazwa ?p)
			(cel wsieci)
		)
	)
	(cennik
		(taryfa ?t)
		(siec_docelowa $?s1)
		(pakiety ?p)
	)
	(cennik
		(taryfa ?t)
		(siec_docelowa $?s2&~$?s1)
		(pakiety)
		(min ?min)
		(sms ?sms)
		(mms ?mms)
	)
	=>
	(assert
		(cennik
			(taryfa ?t)
			(siec_docelowa $?s2)
			(pakiety ?p)
			(min ?min)
			(sms ?sms)
			(mms ?mms)
		)
	)
)


;

(deftemplate filter
	(multislot	siec	(type SYMBOL))
	;(slot	max_cena	(type NUMBER))
)


(defrule filtruj-siec
	(filter
		(siec $? ?s $?)
	)
	(taryfa
		(nazwa ?t)
		(siec ?s)
	)
	?i1 <- (cennik
		(taryfa ?t)
	)
	=>
	(retract ?i1)
)


(defrule filtruj-siec2
	(filter
		(siec $? ?s $?)
	)
	?i1 <- (taryfa
		(siec ?s)
		(nazwa ?t)
	)
	(not(cennik
		(taryfa ?t)
	))
	?i2 <- (transfer
		(taryfa ?t)
	)
	=>
	(retract ?i1 ?i2)
)
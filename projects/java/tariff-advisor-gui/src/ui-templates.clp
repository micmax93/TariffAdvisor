(deftemplate ui-state
    (slot key (type SYMBOL))
    (slot value (type SYMBOL))
)

(deftemplate answer
    (slot key (type SYMBOL))
    (slot value (type SYMBOL NUMBER))
)

(deftemplate doWykonania
    (slot siec_docelowa (type SYMBOL))
    (slot min (type NUMBER))
    (slot sms (type NUMBER))
    (slot mms (type NUMBER))
    (slot net (type NUMBER))
)

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
	(multislot wykMin (type SYMBOL))
	(multislot wykSms (type SYMBOL))
	(multislot wykMms (type SYMBOL))
	(multislot wykNet (type SYMBOL))
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



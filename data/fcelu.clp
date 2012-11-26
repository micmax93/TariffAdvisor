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



(deftemplate zestaw
	(slot	taryfa	(type SYMBOL))
	(multislot pakiety (type SYMBOL))
	(slot	cena	(type NUMBER))
	(slot	srodki	(type NUMBER))
)

(deftemplate darmowe
	(slot	taryfa	(type SYMBOL))
	(multislot pakiety (type SYMBOL))
	
	(slot	cel	(alowed-symbols wsieci wszyscy))
	
	(slot	sms	(type NUMBER)	(default 0)	)
	(slot	min	(type NUMBER)	(default 0)	)
	(slot	net	(type NUMBER)	(default 0)	)
)



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










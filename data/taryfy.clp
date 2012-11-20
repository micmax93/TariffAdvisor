(deftemplate taryfa
	(slot	nazwa	(type SYMBOL)	)
	(slot	sieæ	(type SYMBOL)	)
	(slot	typ		(type SYMBOL)	)
)

(deftemplate cennik
	(slot	taryfa	(type SYMBOL)	)
	(multislot	sieæ_docelowa	(type SYMBOL)	)
	(slot	min	(type NUMBER)	)
	(slot	sms	(type NUMBER)	)
	(slot	mms	(type NUMBER)	)
)

(deftemplate transfer
	(slot	taryfa	(type SYMBOL)	)
	(slot	iloœæ	(type NUMBER) (default 0)	)
	(slot	cena	(type NUMBER)	)
)

(deftemplate doladowania
	(multislot	taryfa	(type SYMBOL)	)
	(slot	cena	(type NUMBER)	)
	(slot	bonus	(type NUMBER)	)
	(slot	waznoœæ	(type NUMBER)	)
)

(deftemplate bonus
	(multislot	taryfa	(type SYMBOL)	)
	(slot	cena	(type NUMBER)	)

	(slot	sms	(type NUMBER)	(default 0)	)
	(slot	min	(type NUMBER)	(default 0)	)
	(slot	net	(type NUMBER)	(default 0)	)
)


;;;;;;;;;;;;; ORANGE ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
(deffacts taryfyOrange
	(taryfa (sieæ Orange) (nazwa OrangeOne))
	(taryfa (sieæ Orange) (nazwa OrangePop))
	(taryfa (sieæ Orange) (nazwa OrangeGo25))
	(taryfa (sieæ Orange) (nazwa OrangeGo50))
	(taryfa (sieæ Orange) (nazwa OrangeGo100))
	(taryfa (sieæ Orange) (nazwa OrangeFree))
)

(deffacts platnosciOrange
	(doladowania	(taryfa OrangeOne)	(cena 25)	(waznosc 25))
	(doladowania	(taryfa OrangeOne)	(cena 40)	(waznosc 40))
	(doladowania	(taryfa OrangeOne)	(cena 50)	(waznosc 50))
	(doladowania	(taryfa OrangeOne)	(cena 100)	(waznosc 100) (bonus 10))
	(doladowania	(taryfa OrangeOne)	(cena 200)	(waznosc 100) (bonus 30))
	
	(doladowania	(taryfa OrangePop OrangeGo25 Orange Free)	(cena 25)	(waznosc 30)	)
	(doladowania	(taryfa OrangePop OrangeGo25 Orange Free)	(cena 40)	(waznosc 40)	)
	(doladowania	(taryfa OrangePop OrangeGo50 Orange Free)	(cena 50)	(waznosc 90)	)
	(doladowania	(taryfa OrangePop OrangeGo100 Orange Free)	(cena 100)	(waznosc 150)	(bonus 10)	)
	(doladowania	(taryfa OrangePop OrangeGo100)	(cena 200)	(waznosc 300)	(bonus 30)	)
)

(deffacts bonusOrangeFree
	(bonus	(taryfa OrangeFree)	(cena 25)	(net 1.01)	)
	(bonus	(taryfa OrangeFree)	(cena 50)	(net 2.27)	)
	(bonus	(taryfa OrangeFree)	(cena 100)	(net 6)	)
)

(deffacts cennikOrange
	(cennik	(taryfa OrangeOne)
			(sieæ_docelowa stacjonarne orange plus tmobile heyah)
			(min 29) (sms 15) (mms 20)
	)
	(cennik	(taryfa OrangeOne)
			(sieæ_docelowa play)
			(min 63) (sms 15) (mms 20)
	)
	
	
	(cennik	(taryfa OrangePop)
			(sieæ_docelowa stacjonarne orange plus tmobile heyah)
			(min 29) (sms 20) (mms 20)
	)
	(cennik	(taryfa OrangePop)
			(sieæ_docelowa play)
			(min 75) (sms 20) (mms 20)
	)
	
	
	(cennik	(taryfa OrangeGo25)
			(sieæ_docelowa stacjonarne orange)
			(min 39) (sms 10) (mms 20)
	)
	(cennik	(taryfa OrangeGo25)
			(sieæ_docelowa plus tmobile heyah)
			(min 49) (sms 18) (mms 20)
	)
	(cennik	(taryfa OrangeGo25)
			(sieæ_docelowa play)
			(min 75) (sms 18) (mms 20)
	)
	
	
	(cennik	(taryfa OrangeGo50)
			(sieæ_docelowa stacjonarne orange)
			(min 29) (sms 5) (mms 10)
	)
	(cennik	(taryfa OrangeGo50)
			(sieæ_docelowa plus tmobile heyah)
			(min 29) (sms 18) (mms 20)
	)
	(cennik	(taryfa OrangeGo50)
			(sieæ_docelowa play)
			(min 75) (sms 18) (mms 20)
	)
	
	
	(cennik	(taryfa OrangeGo100)
			(sieæ_docelowa stacjonarne orange)
			(min 20) (sms 1) (mms 2)
	)
	(cennik	(taryfa OrangeGo100)
			(sieæ_docelowa plus tmobile heyah)
			(min 29) (sms 18) (mms 20)
	)
	(cennik	(taryfa OrangeGo100)
			(sieæ_docelowa play)
			(min 75) (sms 18) (mms 20)
	)
	
	
	(cennik	(taryfa OrangeFree)
			(sieæ_docelowa stacjonarne orange plus tmobile heyah)
			(min 29) (sms 20) (mms 40)
	)
	(cennik	(taryfa OrangePop)
			(sieæ_docelowa play)
			(min 75) (sms 20) (mms 40)
	)
)

(deffacts transferOrange
	(transfer	(taryfa OrangeOne)	(cena 50)	)
	(transfer	(taryfa OrangePop)	(cena 50)	)
	(transfer	(taryfa OrangeGo)	(cena 50)	)
	(transfer	(taryfa OrangeFree)	(cena 1)	)
)

;;;;;;;;;;;;; PLUS ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
(deffacts taryfyPlus
	(taryfa (sieæ Plus) (nazwa PlusNaKarte))
)

(deffacts platnosciPlus
	(doladowania	(taryfa PlusNaKarte)	(cena 30)	(waznosc 30)	)
	(doladowania	(taryfa PlusNaKarte)	(cena 40)	(waznosc 30)	)
	(doladowania	(taryfa PlusNaKarte)	(cena 50)	(waznosc 90)	)
	(doladowania	(taryfa PlusNaKarte)	(cena 60)	(waznosc 90)	)
	(doladowania	(taryfa PlusNaKarte)	(cena 80)	(waznosc 90)	)
	(doladowania	(taryfa PlusNaKarte)	(cena 100)	(waznosc 180)	(bonus 15)	)
	(doladowania	(taryfa PlusNaKarte)	(cena 150)	(waznosc 180)	(bonus 30)	)
)


(deffacts cennikPlus
	(cennik	(taryfa PlusNaKarte)
			(sieæ_docelowa stacjonarne orange plus tmobile heyah)
			(min 29) (sms 19) (mms 40)
	)
	
	(cennik	(taryfa PlusNaKarte)
			(sieæ_docelowa play)
			(min 73) (sms 19) (mms 40)
	)
)

(deffacts transferPlus
	(transfer	(taryfa PlusNaKatre)	(cena 49)	)
)

;;;;;;;;;;;;; TMOBILE ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
(deffacts taryfyTmobile
	(taryfa (sieæ Tmobile) (nazwa TakTakHot))
	(taryfa (sieæ Tmobile) (nazwa NowyTakTak))
)

(deffacts platnosciTmobile
	(doladowania	(taryfa NowyTakTak TakTakHot)	(cena 25)	(waznosc 30)	)
	(doladowania	(taryfa NowyTakTak TakTakHot)	(cena 50)	(waznosc 90)	)
	(doladowania	(taryfa NowyTakTak TakTakHot)	(cena 100)	(waznosc 120)	)
	(doladowania	(taryfa NowyTakTak TakTakHot)	(cena 150)	(waznosc 180)	)
)

(deffacts bonusTmobile
	(bonus	(taryfa NowyTakTak TakTakHot)	(cena 100)	(min 10)	)
	(bonus	(taryfa NowyTakTak TakTakHot)	(cena 150)	(min 30)	)
	(bonus	(taryfa NowyTakTak TakTakHot)	(cena 100)	(sms 40)	)
	(bonus	(taryfa NowyTakTak TakTakHot)	(cena 150)	(sms 120)	)
)

(deffacts cennikTmobile
	(cennik	(taryfa NowyTakTak)
			(sieæ_docelowa stacjonarne orange plus tmobile heyah)
			(min 59) (sms 18) (mms 41)
	)
	(cennik	(taryfa NowyTakTak)
			(sieæ_docelowa play)
			(min 80) (sms 18) (mms 41)
	)
	
	(cennik	(taryfa TakTakHot)
			(sieæ_docelowa stacjonarne orange plus tmobile heyah)
			(min 30) (sms 18) (mms 41)
	)
	(cennik	(taryfa TakTakHot)
			(sieæ_docelowa play)
			(min 80) (sms 18) (mms 41)
	)
)

(deffacts transferTmobile
	(transfer	(taryfa NowyTakTak)	(cena 14.6)	)
	(transfer	(taryfa TakTakHot)	(cena 14.6)	)
)

;;;;;;;;;;;;; PLAY ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
(deffacts taryfyPlay
	(taryfa (sieæ Play) (nazwa PlayNaKarte))
	(taryfa (sieæ Play) (nazwa LubieTo))
	(taryfa (sieæ Play) (nazwa RokWaznosci))
	(taryfa (sieæ Play) (nazwa PlayOnline))
	(taryfa (sieæ Play) (nazwa RedBull))
)

(deffacts platnosciPlay
	(doladowania	(taryfa PlayNaKarte LubieTo RedBull)	(cena 25)	(waznosc 30)	)
	(doladowania	(taryfa PlayNaKarte LubieTo RedBull)	(cena 40)	(waznosc 30)	)
	(doladowania	(taryfa PlayNaKarte LubieTo RedBull)	(cena 50)	(waznosc 100)	)
	(doladowania	(taryfa PlayNaKarte LubieTo RedBull)	(cena 80)	(waznosc 100)	)
	(doladowania	(taryfa PlayNaKarte LubieTo RedBull)	(cena 100)	(waznosc 150)	)
	
	(doladowania	(taryfa RokWaznosci)	(cena 5)	(waznosc 356)	)
	(doladowania	(taryfa RokWaznosci)	(cena 10)	(waznosc 356)	)
	(doladowania	(taryfa RokWaznosci)	(cena 25)	(waznosc 356)	)
	(doladowania	(taryfa RokWaznosci)	(cena 40)	(waznosc 356)	)
	(doladowania	(taryfa RokWaznosci)	(cena 50)	(waznosc 356)	)
	(doladowania	(taryfa RokWaznosci)	(cena 60)	(waznosc 356)	)
	(doladowania	(taryfa RokWaznosci)	(cena 80)	(waznosc 356)	)
	(doladowania	(taryfa RokWaznosci)	(cena 100)	(waznosc 356)	)
	(doladowania	(taryfa RokWaznosci)	(cena 120)	(waznosc 356)	)
	(doladowania	(taryfa RokWaznosci)	(cena 150)	(waznosc 356)	)
	
	(doladowania	(taryfa PlayOnline)	(cena 30)	(waznosc 30)	)
	(doladowania	(taryfa PlayOnline)	(cena 50)	(waznosc 60)	)
	(doladowania	(taryfa PlayOnline)	(cena 75)	(waznosc 90)	)
	(doladowania	(taryfa PlayOnline)	(cena 125)	(waznosc 120)	)
)

(deffacts bonusPlay
	(bonus	(taryfa LubieTo)	(cena 25)	(net 0.5)	)
	(bonus	(taryfa LubieTo)	(cena 50)	(net 1)	)
	(bonus	(taryfa LubieTo)	(cena 100)	(net 2)	)
	
	(bonus	(taryfa RedBull)	(cena 25)	(net 1)	)
	(bonus	(taryfa RedBull)	(cena 50)	(net 2)	)
	(bonus	(taryfa RedBull)	(cena 100)	(net 2)	)
	
	(bonus	(taryfa PlayOnline)	(cena 30)	(net 1.17)	)
	(bonus	(taryfa PlayOnline)	(cena 50)	(net 3.61)	)
	(bonus	(taryfa PlayOnline)	(cena 75)	(net 5.91)	)
	(bonus	(taryfa PlayOnline)	(cena 125)	(net 11.52)	)
)

(deffacts cennikPlay
	(cennik	(taryfa PlayNaKarte)
			(sieæ_docelowa play)
			(min 0) (sms 0) (mms 19)
	)
	(cennik	(taryfa PlayNaKarte)
			(sieæ_docelowa stacjonarne orange plus tmobile heyah)
			(min 29) (sms 9) (mms 19)
	)
	
	(cennik	(taryfa LubieTo)
			(sieæ_docelowa stacjonarne orange plus tmobile play heyah)
			(min 29) (sms 9) (mms 19)
	)
	
	(cennik	(taryfa RokWaznosci)
			(sieæ_docelowa stacjonarne orange plus tmobile play heyah)
			(min 29) (sms 9) (mms 19)
	)
	
	(cennik	(taryfa PlayOnline)
			(sieæ_docelowa stacjonarne orange plus tmobile play heyah)
			(min 29) (sms 9) (mms 19)
	)
	
	(cennik	(taryfa RedBull)
			(sieæ_docelowa stacjonarne orange plus tmobile play heyah)
			(min 29) (sms 9) (mms 19)
	)
)

(deffacts transferPlay
	(transfer	(taryfa PlayNaKarte)	(cena 12)	)
	(transfer	(taryfa LubieTo)	(cena 999999)	)
	(transfer	(taryfa RokWaznosci)	(cena 12)	)
	(transfer	(taryfa PlayOnline)	(cena 0.3333)	)
	(transfer	(taryfa RedBull)	(cena 999999)	)
)


;;;;;;;;;;;;; HEYAH ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
(deffacts taryfyHeyah
	(taryfa (sieæ Heyah) (nazwa NowaHeyah))
)

(deffacts platnosciHeyah
	(doladowania	(taryfa NowaHeyah)	(cena 20)	(waznosc 30)	)
	(doladowania	(taryfa NowaHeyah)	(cena 50)	(waznosc 90)	)
	(doladowania	(taryfa NowaHeyah)	(cena 100)	(waznosc 120)	)
	(doladowania	(taryfa NowaHeyah)	(cena 150)	(waznosc 180)	)
)


(deffacts cennikHeyah
	(cennik	(taryfa NowaHeyah)
			(sieæ_docelowa stacjonarne orange plus tmobile heyah)
			(min 30) (sms 0) (mms 41)
	)
	
	(cennik	(taryfa NowaHeyah)
			(sieæ_docelowa play)
			(min 80) (sms 14) (mms 41)
	)
)

(deffacts transferHeyah
	(transfer	(taryfa NowaHeyah)	(cena 2)	)
)

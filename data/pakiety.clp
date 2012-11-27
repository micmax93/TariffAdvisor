(deffacts pakietyPlay
	(pakietSMS
		(nazwa NielimitowaneSMS)
		(siec Play)
		(cena 10)
		(typ cena)
		(sms 0)
		(cel wszyscy)
	)

	(pakietNet
		(nazwa pakiet1GB)
		(siec Play)
		(cena 10)
		(typ darmowe)
		(net 1)
	)

	
	(pakietMinut
		(nazwa pakiet100minut)
		(siec Play)
		(cena 10)
		(typ darmowe)
		(min 100)
		(cel wsieci)
	)
	
	(pakietMinut
		(nazwa rozmowyWPlay)
		(siec Play)
		(cena 10)
		(typ cena)
		(min 0)
		(cel wsieci)
	)
	
	(pakietMinut
		(nazwa pakiet30minut)
		(siec Play)
		(cena 12)
		(typ darmowe)
		(min 30)
		(cel wszyscy)
	)
)



(deffacts pakietyPlus

	(pakietNet
		(nazwa Internetowy7zl)
		(siec Plus)
		(cena 7)
		(typ darmowe)
		(net 0.1)
	)

	(pakietNet
		(nazwa Internetowy9zl)
		(siec Plus)
		(cena 9)
		(typ darmowe)
		(net 0.15)
	)
	
	(pakietNet
		(nazwa Internetowy15zl)
		(siec Plus)
		(cena 15)
		(typ darmowe)
		(net 0.5)
	)

	(pakietSMS
		(nazwa Pakiet500SMS)
		(siec Plus)
		(cena 5)
		(typ darmowe)
		(sms 500)
		(cel wsieci)
	)
	
	(pakietSMS
		(nazwa Pakiet250SMS)
		(siec Plus)
		(cena 10)
		(typ darmowe)
		(sms 250)
		(cel wszyscy)
	)

	(pakietMinut
		(nazwa TanioDoWszystkich)
		(siec Plus)
		(cena 1.50)
		(typ cena)
		(min 29)
		(cel wszyscy)
	)

	(pakietNumer
		(nazwa NumerWPlusie1)
		(siec Plus)
		(cena 1.5)
		(ile 1)
		(cel wsieci)
		(min 0)
	)

	(pakietNumer
		(nazwa NumerWPlusie2)
		(siec Plus)
		(cena 3)
		(ile 2)
		(cel wsieci)
		(min 0)
	)

	(pakietNumer
		(nazwa NumerWPlusie3)
		(siec Plus)
		(cena 4.5)
		(ile 3)
		(cel wsieci)
		(min 0)
	)

	(pakietNumer
		(nazwa NumerWPlusie4)
		(siec Plus)
		(cena 6)
		(ile 4)
		(cel wsieci)
		(min 0)
	)

	(pakietNumer
		(nazwa NumerWPlusie5)
		(siec Plus)
		(cena 7.5)
		(ile 5)
		(cel wsieci)
		(min 0)
	)

	(pakietNumer
		(nazwa DowolnyNumer)
		(siec Plus)
		(cena 1.5)
		(ile 1)
		(cel wszyscy)
		(min 19)
	)
)



(deffacts pakietyOrange

	
	(pakietSMS
		(nazwa Pakiet100SMS)
		(siec Orange)
		(cena 5)
		(typ darmowe)
		(sms 100)
		(cel wszyscy)
	)
	(pakietMMS
		(nazwa Pakiet37MMS)
		(siec Orange)
		(cena 5)
		(typ darmowe)
		(mms 37)
		(cel wszyscy)
	)
	(pakietSMS
		(nazwa PakietSMSzaGrosze)
		(siec Orange)
		(cena 6)
		(typ cena)
		(sms 1)
		(cel wszyscy)
	)
	(pakietSMS
		(nazwa Pakiet1000SMS)
		(siec Orange)
		(cena 10)
		(typ darmowe)
		(sms 1000)
		(cel wsieci)
	)
	
	(pakietMinut
		(nazwa PakietMinutZaGrosz)
		(taryfa OrangeOne)
		(cena 10)
		(typ cena)
		(min 1)
		(cel wsieci)
	)
	(pakietMinut
		(nazwa popGadane)
		(taryfa OrangePop)
		(cena 6)
		(typ cena)
		(min 20)
		(cel wsieci)
	)
	(pakietMinut
		(nazwa popMinuty)
		(taryfa OrangePop)
		(cena 12)
		(typ cena)
		(min 10)
		(cel wsieci)
	)
	(pakietMinut
		(nazwa WygadanyPakiet)
		(taryfa OrangePop OrangeOne)
		(cena 9)
		(typ cena)
		(min 18)
		(cel wszyscy)
	)
	
	
	
	(pakietNumer
		(nazwa Wybrane3Numery)
		(taryfa OrangeOne)
		(cena 6)
		(cel wsieci)
		(ile 3)
		(min 0)
	)

	
	(pakietNet
		(nazwa Internetowy30dni)
		(taryfa OrangePop OrangeOne OrangeGo25 OrangeGo50 OrangeGo100)
		(cena 10)
		(typ darmowe)
		(net 100)
	)
	(pakietNet
		(nazwa InternetowyXXL)
		(taryfa OrangePop OrangeOne OrangeGo25 OrangeGo50 OrangeGo100)
		(cena 15)
		(typ darmowe)
		(net 500)
	)
	
	(pakietNet
		(nazwa Internetowy1)
		(taryfa OrangeFree)
		(cena 5)
		(typ darmowe)
		(net 200)
	)
		
	(pakietNet
		(nazwa Internetowy2)
		(taryfa OrangeFree)
		(cena 10)
		(typ darmowe)
		(net 600)
	)
		
	(pakietNet
		(nazwa Internetowy3)
		(taryfa OrangeFree)
		(cena 20)
		(typ darmowe)
		(net 1000)
	)
	
)



(deffacts pakietyTmobile

	(pakietSMS
		(nazwa Pakiet600sms)
		(taryfa NowyTakTak)
		(cena 12)
		(typ darmowe)
		(sms 600)
		(cel wsieci)
	)
	(pakietMMS
		(nazwa Pakiet100mms)
		(taryfa NowyTakTak)
		(cena 12)
		(typ darmowe)
		(mms 100)
		(cel wsieci)
	)
	

	(pakietMinut
		(nazwa Pakiet150Minut)
		(taryfa NowyTakTak)
		(cena 9)
		(typ darmowe)
		(min 150)
		(cel wsieci)
	)
	

	(pakietNumer
		(nazwa NumerkiZaGrosze)
		(siec Tmobile)
		(cena 9)
		(cel wszyscy)
		(ile 3)
		(min 0)
	)
	
	
	(pakietNet
		(nazwa Pakiet100MB)
		(siec Tmobile)
		(cena 9)
		(typ darmowe)
		(net 100)
	)
	(pakietNet
		(nazwa Pakiet350MB)
		(siec Tmobile)
		(cena 12)
		(typ darmowe)
		(net 350)
	)
	(pakietNet
		(nazwa Pakiet600MB)
		(siec Tmobile)
		(cena 16)
		(typ darmowe)
		(net 600)
	)
	(pakietNet
		(nazwa Pakiet1200MB)
		(siec Tmobile)
		(cena 29)
		(typ darmowe)
		(net 1200)
	)	
)


(deffacts pakietyHeyah

	(pakietNet
		(nazwa InternetNonStop)
		(siec Heyah)
		(cena 9)
		(typ darmowe)
		(net 100)
	)
	(pakietNet
		(nazwa InternetNonStopL)
		(siec Heyah)
		(cena 15)
		(typ darmowe)
		(net 600)
	)
	(pakietNet
		(nazwa InternetNonStopXL)
		(siec Heyah)
		(cena 25)
		(typ darmowe)
		(net 1200)
	)
	
	
	(pakietMinut
		(nazwa RozmowyBezLimitu)
		(siec Heyah)
		(cena 9)
		(typ cena)
		(min 0)
		(cel wsieci)
	)
	
	
	(pakietSMS
		(nazwa DoWszystkich1000SMS)
		(siec Heyah)
		(cena 4)
		(typ darmowe)
		(sms 1000)
		(cel wszyscy)
	)

)


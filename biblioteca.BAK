*** Calcular a faixa que se enquadra a nota
*** Verificar quantos vistos a nota ja tem
*** Verificar quantas aprovaçoes a nota ja tem
*** Verificar quantas aprovaçoes e vistos são necessários para aprovar a nota
Procedure calcularOpe
	Parameters tiIDNota, tlOpcao, lnValorNota
	Local lnTotal, liFaixa

	If !Empty(tiIDNota)
		Do Case
			Case tlOpcao =  1 && Faixa
				If !Empty(lnValorNota)
					Select tabFaixa
					Locate For tabFaixa.faixaini <= lnValorNota  And lnValorNota <= tabFaixa.faixaFim
					If Found()
						Return tabFaixa.Id
					Endif
					Go Top
				Endif
			Case tlOpcao =  2 && Vistos
				Select tabVistos
				Count For idNota = tiIDNota To lnTotal
				Return lnTotal
				Go Top
			Case tlOpcao =  3 && Aprovações
				Select tabAut
				Count For idNota = tiIDNota To lnTotal
				Return lnTotal
				Go Top
			Case tlOpcao =  4 && Vistos necessários
				If !Empty(lnValorNota)
					Select tabFaixa
					Locate For tabFaixa.faixaini <= lnValorNota  And lnValorNota <= tabFaixa.faixaFim
					If Found()
						Return tabFaixa.vistos
					Endif
					Go Top
				Endif
			Case tlOpcao =  5 && Aprovações necessárias
				If !Empty(lnValorNota)
					Select tabFaixa
					Locate For tabFaixa.faixaini <= lnValorNota  And lnValorNota <= tabFaixa.faixaFim
					If Found()
						Return tabFaixa.Aprov
					Endif
					Go Top
				Endif
			Otherwise
				Return 0
		Endcase
	Endif
	Return 0
Endproc

***Verificar se o usuário já vistou ou aprovou algo em uma nota
Procedure podeProcessar
	Parameters tiIdUser, tiIDNota
	If !Empty(tiIdUser) And !Empty(tiIDNota)
		Select Count(*) As existe From tabVistos Where  idNota = tiIDNota And idUsuario = tiIdUser Into Cursor curFound
		If curFound.existe = 0
			Select Count(*) As existe From tabAut Where  idNota = tiIDNota And idUsuario = tiIdUser Into Cursor curFound
			If curFound.existe = 0
				Use In curFound
				Return .T.
			Endif
		Endif
	Endif
	Return .F.
Endproc

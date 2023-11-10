#INCLUDE "PROTHEUS.CH"

/*---------------------------------------------------------------------------+
!                       FICHA TECNICA DO PROGRAMA                            !
+----------------------------------------------------------------------------+
!Autor             ! Caio Rafael                                             !
!                  ! E-Mail caio.rafael@guaraves.com                         !
+------------------+---------------------------------------------------------+
!Descricao         ! Corre��o da data das inutiliza��es no livro fiscal      !
!                  !                  USO INTERNO(T.I)                       !
+------------------+-------------------------+------------+------------------+
!Nome              ! corLiFi                    !Vers�o      ! 1.0.0         !
+------------------+-------------------------+------------+------------------+
!Data de Criacao   ! 08/11/2023              !            !                  !
+------------------+-------------------------+------------+------------------+
!                                                                            !
+---------------------------------------------------------------------------*/

User Function corLiFi()
	local aArea         := GetArea()
	local cAlias
	local bNaoLocaliza  := .T.
	local aNaoPermi  := {}
	local aCorrigidas   :=  {}
	local dData := dDataBase

	DbSelectArea("SFT") // Selecionado a tabela SFT.
	DbSetOrder(14) // FT_FILIAL + FT_NFISCAL + FT_SERIE.
	DbSelectArea("SF3") // Selecionando a tabela SF3.
	DbSetOrder(6) // F3_FILIAL + F3_NFISCAL + F3_SERIE.

	while Pergunte("CORRELF", .T.) // Enquanto usu�rio n�o clicar em cancelar vai continuar na rotina.
		aNaoPermi  := {"NOTAS N�O PERMITIDAS", replicate("-", 30)}
		aCorrigidas := {"NOTAS CORRIGIDAS", replicate("-", 30)}
		cAlias := xQuery()
		while !(cAlias)->(EOF()) // Enquanto n�o for o ultimo registro.
			bNaoLocaliza:= .F.
			SF3->(DbgoTo((cAlias)->f3_rec)) // Ir� buscar os registros da query.
			if MV_PAR05 > dData
				Alert("N�o � permitido alterar para a data informada!")
				exit
			else
				if xVerificar() // Se a fun��o retornar .T. (For uma nota inutilizada).
					xUpdate() // Chama a fun��o para alterar os campos.
					aadd(aCorrigidas, "Filial Nota Fiscal: "  + SF3->F3_FILIAL) 
					aadd(aCorrigidas, "Nota Fiscal: "         + SF3->F3_NFISCAL)
					aadd(aCorrigidas, "Serie Nota Fiscal: "   + SF3->F3_SERIE )
					aadd(aCorrigidas, REPLICATE( "-", 30 ))
					(cAlias)->(DbSkip()) // Pular para o proximo registro.
					
				else // Se tiver alguma nota n�o permitida(autorizada/cancelada).
					aadd(aNaoPermi, "Filial Nota Fiscal: "  + SF3->F3_FILIAL)
					aadd(aNaoPermi, "Nota Fiscal: "         + SF3->F3_NFISCAL)
					aadd(aNaoPermi, "Serie Nota Fiscal: "   + SF3->F3_SERIE )
					aadd(aNaoPermi, REPLICATE( "-", 30 ))
					(cAlias)->(DbSkip()) // Pular para o proximo registro.
					Loop
				endIf
			EndIf
		End

		(cAlias)->(DbCloseArea())

		if bNaoLocaliza // Caso o usu�rio informe uma nota n�o encontrada.
			Alert("Nota n�o encontrada!")
		endif
		
		Do Case
			case len(aCorrigidas) > 2 .and. len(aNaoPermi) <= 2 // Ir� informar as notas corrigidas.
				u_LongMsg(aCorrigidas, "NOTAS CORRIGIDAS")	
			case len(aNaoPermi) > 2 .and. len(aCorrigidas) <= 2  .and. bNaoLocaliza == .F. // Ir� informar as notas que n�o foram permitidas as corre��es.
				u_LongMsg(aNaoPermi, "NOTAS N�O PERMITIDAS")
			case len(aCorrigidas) > 2 .and. len(aNaoPermi) > 2 // Ir� informar as notas corrigidas e n�o permitidas.
				u_LongMsg(aCorrigidas, "NOTAS CORRIGIDAS")	
				u_LongMsg(aNaoPermi, "NOTAS N�O PERMITIDAS")
		End Case	
		bNaoLocaliza:= .T.

	End
	RestArea(aArea)
return

static Function xQuery()
	local cQuerySf3 := ""
	local cAlias := getNextAlias()
	cQuerySf3 := "  SELECT R_E_C_N_O_ as f3_rec FROM " + RetSqlName('SF3') + " WHERE F3_FILIAL = '" + MV_PAR01                       
	cQuerySf3 += "' AND F3_NFISCAL BETWEEN '" + MV_PAR02 + "' AND '" + MV_PAR03                	
	cQuerySf3 += "' AND F3_SERIE = '" + MV_PAR04                                               
	cQuerySf3 += "' AND D_E_L_E_T_ = ' ' "		                                                
	dbUseArea(.T., "TOPCONN", TCGenQry(,,cQuerySf3), cAlias, .F., .T.)
return cAlias

Static function xUpdate()
	RecLock("SFT", .F.) 
	SFT->FT_ENTRADA := MV_PAR05 // Alterando a data do campo FT_ENTRADA para a data informada
	SFT->FT_EMISSAO := MV_PAR05 // Alterando a data do campo FT_EMISSAO para a data informada
	SFT->FT_DTCANC  := MV_PAR05 // Alterando a data do campo FT_DTCANC para a data informada
	SFT->(MsUnlock())

	RecLock("SF3", .F.) 
	SF3->F3_ENTRADA := MV_PAR05 // Alterando a data do campo F3_ENTRADA para a data informada
	SF3->F3_EMISSAO := MV_PAR05 // Alterando a data do campo F3_EMISSAO para a data informada
	SF3->F3_DTCANC  := MV_PAR05 // Alterando a data do campo F3_DTCANC para a data informada
	SF3->(MsUnlock())
return

Static Function xVerificar()
	Local bValida := .F.
	if (SF3->F3_CODRSEF == '102') 
		bValida := .T.
	else
		bValida := .F.
	endif
Return bValida

static function LongMsg(aMsg,cTitulo) 
    local nX
    Local oDlg  
    Local cMGet := ""

    for nX:=1 to Len(aMsg)
        cMGet += aMsg[nX] + Char(13)+ Char(10)
    next
    oDlg:= TDialog():New( 000/* nTop */,000 /* nLeft */,300 /* nBottom */,500 /* nRight */,cTitulo /* cCaption */, /* uParam6 */, /* uParam7 */, /* uParam8 */, /* uParam9 */, /* nClrText */, /* nClrBack */, /* uParam12 */, /* oWnd */, .T./* lPixel */, /* uParam15 */, /* uParam16 */, /* uParam17 */, /* nWidth */, /* nHeight */, /* lTransparent */ )
    tSay():New(005,000,{||cTitulo },oDlg,/*cPicture*/,/*oFont*/,/*param7*/,/*param8*/,/*param9*/,.T.,/*color_text*/,/*Color_back*/,250,20,/*param15*/,/*param16*/,/*param17*/,/*param18*/,/*param19*/,/*lhtml*/,2,2)
    TMultiGet():New(025, 005, {| u | iif( pCount() > 0, cMGet := u, cMGet ) }/* bSetGet */, oDlg/* oWnd */,240 /* nWidth */,100 /* nHeight */, /* oFont */, /* uParam8 */, /* uParam9 */, /* uParam10 */, /* uParam11 */,.T. /* lPixel */, /* uParam13 */, /* uParam14 */, /* bWhen */, /* uParam16 */, /* uParam17 */,.T. /* lReadOnly */, /* bValid */, /* uParam20 */, /* uParam21 */, /* lNoBorder */,.F. /* lVScroll */, /* cLabelText */, /* nLabelPos */, /* oLabelFont */, /* nLabelColor */ )
    TButton():new(130,190,'OK'          ,oDlg,{|| oDlg:END()},060,20,,,,.T.,,,,{|| .T.})
    oDlg:ACTIVATE(,,,.T.)

return 


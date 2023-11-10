#INCLUDE "protheus.ch"

/*---------------------------------------------------------------------------+
!                       FICHA TECNICA DO PROGRAMA                            !
+----------------------------------------------------------------------------+
!Autor             ! Caio Rafael Dos Santos Silva                            !
!                  ! E-Mail caio.rafael@guaraves.com                         !
+------------------+---------------------------------------------------------+
!Descricao         ! LIMPA RESERVA - USO INTERNO(T.I)                        !
!                  !                                                         !
+------------------+-------------------------+------------+------------------+
!Nome              ! lmpRes                    !Vers�o      ! 1.0.0          !
+------------------+-------------------------+------------+------------------+
!Data de Criacao   ! 03/11/2023              !            !                  !
+------------------+-------------------------+------------+------------------+
!                                                                            !
+---------------------------------------------------------------------------*/
user function lmpRes()
	local aArea   := GetArea()
	if Pergunte("LRESERVA", .T.)
		// Selecionado a tabela
		DbSelectArea("SB2")
		DbSetOrder(1)

		// Se conseguir posicionar no registro
		if SB2->(DbSeek(MV_PAR01 + MV_PAR02 + MV_PAR03))
			// Atualizando o valor da reserva do produto
			RecLock("SB2", .F.) // .F. � altera��o, .T. � inclus�o
			SB2->B2_RESERVA := 0
            SB2->B2_RESERV2 := 0
			SB2->(MsUnlock()) // Destravar a tabela
			Aviso("ATEN��O", CRMSG(.T.), {"OK"}, 3,,,)
		else
			Aviso("ATEN��O", CRMSG(.F.), {"OK"}, 3,,,)
		EndIf
		restArea(aArea)
	EndIf
return

Static Function CRMSG(lok)
	Local cMsg   := ""

	cMsg += "REGISTRO"+IIF( lok, " ", " N�O " )+"LOCALIZADO" + CRLF
	cMsg += "FILIAL DO PRODUTO: "+ Alltrim(MV_PAR01) + CRLF
	cMsg += "C�DIGO DO PRODUTO: "+ Alltrim(MV_PAR02) + CRLF
	cMsg += "LOCAL DO PRODUTO: " + Alltrim(MV_PAR03)+ CRLF

Return cMsg

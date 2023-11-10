#INCLUDE "Protheus.ch"


user Function tQuery()
    local aArea   := GetArea()
    local cQrySA2 := ""
    local nAtual  := 0
    // Selecionado os fornecedores via query no banco de dados

    cQrySA2 := "  SELECT " + CRLF
    cQrySA2 += "  A2_COD, " + CRLF
    cQrySA2 += "  A2_NOME " + CRLF
    cQrySA2 += "  FROM " + CRLF
    cQrySA2 += "   " + RetSQLName('SA2') + " SA2 " + CRLF
    cQrySA2 += "  WHERE " + CRLF
    cQrySA2 += "  A2_LOJA = '01' " + CRLF
    cQrySA2 += "  AND A2_MSBLQL <> '1' " + CRLF
    cQrySA2 += "  AND SA2.D_E_L_E_T_ = ' ' " + CRLF
    cQrySA2 += "  ORDER BY " + CRLF
    cQrySA2 += "  A2_COD " + CRLF

    // EXECUTANDO A QUERY

    PLSQuery(cQrySA2,"QRY_SA2")

    While ! QRY_SA2->(EoF())
        nAtual++

        QRY_SA2->(DbSKip())
    EndDo
    
    QRY_SA2->(DbCloseArea())

    MsgInfo(cValToChar(nAtual) + " Fornecedores encontrados!")
    
    RestArea(aArea)
Return 

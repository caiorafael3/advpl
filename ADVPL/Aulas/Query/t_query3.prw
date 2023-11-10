#INCLUDE "Protheus.ch"

User Function t_query3()
    local aArea    := GetArea()
    local cBanco   := "000"
    local cAgencia := "00000"
    local cConta   := "0000000000"
    local cNomeBco := "BANCO DE TESTE" + dTos(date())

    // SELECIONANDO A TABELA
    DbSelectArea('SA6')
    SA6->(DbSetOrder(1)) // seleciona a ordem 

    // Posicionar o registro
    if SA6->(DbSeek(FWxFilial('SA6') + cBanco + cAgencia + cConta))
        // ATUALIZANDO O NOME DO BANCO
        RecLock('SA6', .F.) // .T. incluir, .F. alterar
            SA6->A6_NOME := cNomeBco
        SA6->(MsUnlock())
    EndIf

    RestArea(aArea)
return

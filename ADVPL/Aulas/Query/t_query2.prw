#INCLUDE "Protheus.ch"


User Function t_query2()
    local aArea  := GetArea()
    local aDados := {}
    private lMsErroAuto := .F.

    // Adicionando os dados do cadastro do banco
    aAdd(aDados, {"A6_COD",      "000",             NIL})
    aAdd(aDados, {"A6_AGENCIA",  "00000",           NIL})
    aAdd(aDados, {"A6_NUMCON",   "0000000000",      NIL})
    aAdd(aDados, {"A6_NOME",     "BANCO DE TESTE",  NIL})
    
    // INICIANDO TRANSAÇÃO
    Begin Transaction
        MSExecAuto({|x , y| Mata070(x , y)}, aDados, 3) // 3 INCLUIR 4 ALTERAR 5 EXCLUIR

        // Se houver erro, mostra a mensagem
        if lMsErroAuto
            MostraErro()
            DisarmTransaction()
        else
            MsgInfo("Banco De Teste Cadastrado com Sucesso1!")
        EndIf
    End Transaction

    RestArea(aArea)
return

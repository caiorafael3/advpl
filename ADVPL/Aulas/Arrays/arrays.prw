#INCLUDE "protheus.ch"


User Function VendoArray()
    Local nTam := 0
    local nPos := 0
    local cConteudo := ""
    local aNumeros := {10,20,19,4,14}

    local aTabela := {}

    local aCores := {"verde","amarelo","azul","branco"}

    local aCores3 := ACLONE( aCores ) // vai estar copiando o array para outra variavel, a outra variavel vai estar recebendo os mesmos dados.

    nTam := LEN( aCores3 ) // tamanho do array

    AADD( aTabela, {"Banana", 7, "Quilo", CTOD("25/04/2023")} ) // AADD vai adicionar na Array, CTOD converte do tipo string para o tipo date.

    cConteudo := ATAIL( aCores ) // verifica o conteudo da ultima posição da array

    nPos := ASCAN( aCores, "verde") // retorna a posição de 'verde'  no array

    ASORT( aNumeros) // ordena a array  
Return 

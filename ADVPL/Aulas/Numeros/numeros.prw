#INCLUDE "protheus.ch"

// Fun��es mais usadas


User Function numeros()
    local nNum1 := 0
    local nNum2 := 0
    local cNumStr := " "
    local cResposta := " "
    local nQtdDecima := 3

    local nRes := 0

    // Retorna o valor absoluto
    nNum1 := -560.45
    nRes := ABS( nNum1 ) // Fun��o ABS retorna o proprio numero sem o sinal(-)

    nNum1 := 685.7665
    nRes := int(nNum1) // Fun��o Int retorna o proprio numero sem as decimais, retorna ele inteiro.

    nNum1 := 100
    nNum2 := 200
    nRes := MAX( nNum1, nNum2 ) // Fun��o MAX retorna o maior entre os 2 numeros.

    nNum1 := 100
    nNum2 := 200
    nRes := MIN( nNum1, nNum2 ) // Fun��o MIN retorna o menor entre os 2 numeros.

    nNum1 := 1234.98776
    nRes := Round( nNum1, nQtdDecima ) // Fun��o Round = primeiro paramentro � o numero, segundo parametro � a quantidade de decimais que vai querer que retorne. vai retornar o numero com a quantidade de decimais desejada. COM ARREDONDAMENTO.

    nNum1 := 1234.98776
    nRes := noRound( nNum1, nQtdDecima ) // Fun��o Round = primeiro paramentro � o numero, segundo parametro � a quantidade de decimais que vai querer que retorne. vai retornar o numero com a quantidade de decimais desejada. SEM ARREDONDAMENTO.

    nNum1 := 10
    nNum2 := 20
    nRes := RANDOMIZE( nNum1, nNum2 ) // fun��o randomize retorna um numero aletorio entre os dois numeros.

    cRes := val(cNumStr) // fun��o converte texto para numero

    nNum1 := 10
    nRes := CVALTOCHAR( nNum1 ) // Fun��o converte o numero para texto

    nNum1 := 115626649.45561
    cResposta := "Um dia... " + TRANSFORM( nNum1, "@E 999,999,999.99" ) // Fun��o transform retorna o numero de uma forma de dinheiro.



Return 


User Function Operadores()
    local cTexto1 := ""
    local cTexto2 := ""
    local cResposta := ""

    cTexto1 := "Caio"
    cTexto2 := "Jo�o, Eliane, Caio"
    cResposta := cTexto1 $ cTexto2 // O $ vai comparar as duas strings, vai verificar se caio na variavel cTexto1 est� dentro da variavel cTexto2.

Return 


//------------------------ STRING ------------------//


User Function VendoString()
    local cTexto1 := ""
    local cTexto2 := ""
    local cTexto3 := ""
    local cResp := ""
    local lResp := .T.
    local nResp := 0

    cTexto1 := "Eu" + CRLF // crlf vai estar quebrando a linha.
    cTexto2 += "Estou" + CRLF
    cTexto3 += "Com fome" + CRLF

    cTexto1 := "     OLA       "
    cTexto1 := LTRIM( cTexto1 ) // Fun��o LTRIM retira os espa�os do lado esquerdo
    cTexto1 := RTRIM( cTexto1 ) // Fun��o RTRIM retira os espa�os do lado direito
    cTexto1 := ALLTRIM( cTexto1 ) // Fun��o ALLTRIM retira os espa�os dos dois lados.

    cTexto1 := SPACE(10) // Fun��o space cria espa�os

    cTexto1 := "Caio Rafael dos Santos Silva"
    cResp := AT("Rafael", cTexto1 ) // Fun��o AT vai buscar a String na variavel.

    cResp := RAT( "a", cTexto1 ) // Fun��o RAT vai buscar a ultima vez que aparece a string.

    cTexto1 := "A"
    lResp := ISALPHA( cTexto1 ) // Fun��o ISALPHA vai retornar se � letra

    cTexto1 := "1"
    lResp := ISDIGIT( cTexto1 ) // Fun��o ISDIGIT vai retornar se � numero 

    cTexto := "Caio Rafael"
    nResp := LEN( cTexto ) // Fun��o len verifica a quantidade dentro da variavel

    cTexto := "Caio Rafael"
    cRes := LEFT( cTexto, 5 ) // Fun��o LEFt vai pegar as 5 primeira letras da esquerda.

    cRes := RIGHT( cTexto, 5 ) // Fun��o RIGHT vai pegar as 5 primeiras letras do lado direito.

    Texto := "Caio Rafael"
    cRes := LOWER( Texto ) // fun��o vai retornar tudo maiusculo

    cRes := UPPER( Texto ) // Fun��o vai retornar tudo minusculo

    cTexto1 := "Caio Rafael"
    cRes := PADC( cTexto1, 30, "-" ) // Essa fun��o vai retornar a variavel em um espa�o de 30, preenchendo a variavel e o restante com '-'.

    cRes := REPLICATE( "-", 10 ) //vai escrever '-' 10 vezes.

    cTexto := "Caio, Tiago, Caua, Joao, Eliane"
    aResp := STRTOKARR( cTexto, "," ) // vai separar a lista com ','
Return 



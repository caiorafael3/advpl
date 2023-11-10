#INCLUDE "Protheus.ch"

User Function exeCalcular(cOperacao)
   PRIVATE nResultado := 0

   PRIVATE nNum1 := 10
   PRIVATE nNum2 := 20
   DEFAULT cOperacao := ""

   if !EMPTY(cOperacao)
        if (cOperacao == "soma")
            u_exeSoma()
        elseif (cOperacao == "subtracao")
            u_exeSubtracao()
        elseif (cOperacao == "multiplicacao")
            u_exeMultiplicacao()
        elseif (cOperacao == "divisao")
            u_exeDivisao()
        endif
   endif
Return 

User Function exeSoma()
    nResultado = nNum1 + nNum2
    alert("O resultado da soma de " + CVALTOCHAR(nNum1) + "e" + CVALTOCHAR(nNum2) + " é igual a: " + CVALTOCHAR(nResultado))
Return 

User Function exeSubtracao()
    nResultado = nNum1 - nNum2
    alert("O resultado da subtração de " + CVALTOCHAR(nNum1) + "e" + CVALTOCHAR(nNum2) + " é igual a: " + CVALTOCHAR(nResultado))
Return 

User Function exeMultiplicacao()
    nResultado = nNum1 * nNum2
    alert("O resultado da multiplicação de " + CVALTOCHAR(nNum1) + "e" + CVALTOCHAR(nNum2) + " é igual a: " + CVALTOCHAR(nResultado))
Return 

User Function exeDivisao()
    nResultado = nNum1 / nNum2
    alert("O resultado da divisão de " + CVALTOCHAR(nNum1) + "e" + CVALTOCHAR(nNum2) + " é igual a: " + CVALTOCHAR(nResultado))
Return


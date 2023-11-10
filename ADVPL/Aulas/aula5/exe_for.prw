#INCLUDE "protheus.ch"


User Function exeFor()
    local nInicio := 0
    local nFim := 10
    for nInicio := 1 to nFim 
        if (nInicio == 5)
            alert("Chegou em 5")
        endif
        alert(nInicio)
    NEXT

Return 

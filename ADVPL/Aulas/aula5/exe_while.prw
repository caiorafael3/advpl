User Function exe_while()
    local nCont := 1

    while (nCont <= 10)

        if(nCont % 2 == 0)
            alert("O numero � par")
            nCont++
            loop // volta ao inicio do loop
            
        endif

        if(nCont == 5)
            alert("Chegou no 5")
            exit // for�a a parada do while 
        end

        alert(nCont)
        nCont++

    end
Return 

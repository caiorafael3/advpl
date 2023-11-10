
User Function do_case()
    local nNumero := 10
    Do case
        case nNumero > 10
            msgalert("Numero é maior","Numero")
        case nNumero < 10
            msgalert("Numero é menor","Numero")
        OtherWise
            msgalert("Numero é igual","Numero")
    End case
Return 

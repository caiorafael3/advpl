
User Function do_case()
    local nNumero := 10
    Do case
        case nNumero > 10
            msgalert("Numero � maior","Numero")
        case nNumero < 10
            msgalert("Numero � menor","Numero")
        OtherWise
            msgalert("Numero � igual","Numero")
    End case
Return 

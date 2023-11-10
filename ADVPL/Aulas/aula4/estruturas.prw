
User Function venda()
    local nEstoque := 100
    local nVenda := 200
    local cVendaEst := "SIM"

    if (nEstoque > nVenda)
       msgalert("Pedido de venda Liberado!","Pedido de venda") 
    elseif (nVenda > nEstoque .and. cVendaEst == "SIM")
        msgalert("Pedido de venda Liberado, mas estamos sem saldo","Pedido de venda") 
    else
        msgalert("Pedido de venda não foi Liberado!","Pedido de venda")
    endif
Return 

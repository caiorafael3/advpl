/*
local: Visivel apenas dentro da fun��o.
private: visivel dentro da fun��o e depois a fun��o
public: visivel antes, dentro e depois da fun��o
static: visivel em qualquer momento dentro do fonte/arquivo
*/


User Function func1()
    local var1 := "Local"
    private var2 := "Private"
    u_func2()
Return 

User Function func2()
    public var3 := "Public"

    alert(var2)
    alert(var3)
    
Return 




// Feather disable all

function LatSymbolsGetUsed()
{
    static _system = __LatSystem();
    
    return _system.__symbolsUsed;
}
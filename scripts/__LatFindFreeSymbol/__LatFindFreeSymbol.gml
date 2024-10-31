// Feather disable all

function __LatFindFreeSymbol()
{
    static _symbolsFreeArray = __LatSystem().__symbolsFreeArray;
    
    var _i = __symbolsPrevFree + 1;
    repeat(LATTICE_TOTAL_SYMBOLS - _i)
    {
        if (_symbolsFreeArray[_i])
        {
            __symbolsFreeArray[_i] = false;
            ++__symbolsUsed;
            ++__symbolsPrevFree;
            return _i;
        }
        
        ++_i;
    }
    
    // Wrap around to the start and try again
    var _i = 1;
    repeat(__symbolsPrevFree)
    {
        if (_symbolsFreeArray[_i])
        {
            __symbolsFreeArray[_i] = false;
            ++__symbolsUsed;
            ++__symbolsPrevFree;
            return _i;
        }
        
        ++_i;
    }
    
    __LatError($"No space on symbols texture");
}
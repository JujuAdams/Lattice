// Feather disable all

/// @param index

function LatPaletteGet(_index)
{
    static _paletteArray = __LatSystem().__paletteArray;
    
    return _paletteArray[_index];
}
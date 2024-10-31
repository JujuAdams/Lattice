// Feather disable all

/// @param sprite

function LatTextSetFont(_fontSprite)
{
    static _system = __LatSystem();
    
    with(_system)
    {
        __fontSprite       = _fontSprite;
        __fontCharacterMap = __fontMap[? _fontSprite];
    }
}
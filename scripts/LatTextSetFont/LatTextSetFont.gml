// Feather disable all

/// @param font

function LatTextSetFont(_font)
{
    static _system = __LatSystem();
    
    with(_system)
    {
        __fontInfo = font_get_info(_font);
        __font     = _font;
    }
}
// Feather disable all

/// @param font

function LatTextSetFont(_font)
{
    static _system = __LatSystem();
    
    with(_system)
    {
        __fontInfo = font_get_info(_font); //FIXME - Cache this value
        __font     = _font;
    }
}
// Feather disable all

/// @param text

function LatTextGetHeight(_text)
{
    static _system = __LatSystem();
    
    var _oldFont  = draw_get_font();
    draw_set_font(_system.__font);
    var _height = ceil(string_height(_text) / LATTICE_CELL_HEIGHT);
    draw_set_font(_oldFont);
    
    return _height;
}
// Feather disable all

/// @param text

function LatTextGetWidth(_text)
{
    static _system = __LatSystem();
    
    var _oldFont  = draw_get_font();
    draw_set_font(_system.__font);
    var _width = ceil(string_width(_text) / LATTICE_CELL_WIDTH);
    draw_set_font(_oldFont);
    
    return _width;
}
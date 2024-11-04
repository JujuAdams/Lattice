// Feather disable all

/// @param x
/// @param y
/// @param text
/// @param fgColor
/// @param [bgColor]

function LatDrawText(_x, _y, _text, _fgColor, _bgColor = undefined)
{
    static _system = __LatSystem();
    
    var _oldFont  = draw_get_font();
    draw_set_font(_system.__font);
    
    if (_bgColor != undefined)
    {
        LatDrawRect(_x, _y, _x + LatTextGetWidth(_text)-1, _y + LatTextGetHeight(_text)-1, _bgColor);
    }
    
    var _oldColor = draw_get_color();
    draw_set_color(_fgColor);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    
    draw_text(LATTICE_CELL_WIDTH*_x, LATTICE_CELL_HEIGHT*_y, _text);
    
    draw_set_font(_oldFont);
    draw_set_font(_oldColor);
}
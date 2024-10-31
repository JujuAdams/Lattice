// Feather disable all

/// @param index
/// @param color

function LatPaletteSet(_index, _color)
{
    static _system = __LatSystem();
    static _paletteArray = __LatSystem().__paletteArray;
    
    surface_set_target(_system.__paletteSurface);
    draw_point_color(_index, 0, _color);
    surface_reset_target();
    
    _paletteArray[_index] = _color;
}
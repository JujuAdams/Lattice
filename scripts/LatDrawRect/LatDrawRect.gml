// Feather disable all

/// @param left
/// @param top
/// @param right
/// @param bottom
/// @param color

function LatDrawRect(_left, _top, _right, _bottom, _color)
{
    draw_sprite_stretched_ext(__LatPixel, 0,
                              LATTICE_CELL_WIDTH*_left, LATTICE_CELL_HEIGHT*_top,
                              LATTICE_CELL_WIDTH*(1 + _right - _left), LATTICE_CELL_HEIGHT*(1 + _bottom - _top),
                              _color, 1);
}
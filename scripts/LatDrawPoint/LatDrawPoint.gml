// Feather disable all

/// @param x
/// @param y
/// @param color

function LatDrawPoint(_x, _y, _color)
{
    draw_sprite_ext(__LatPixel, 0,
                    LATTICE_CELL_WIDTH*_x, LATTICE_CELL_HEIGHT*_y,
                    1, 1, 0,
                    _color, 1);
}
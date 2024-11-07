// Feather disable all

/// @param x
/// @param y
/// @param color

function __LatDrawPoint(_x, _y, _color)
{
    draw_sprite_ext(__LatPixel, 0, _x, _y, 1, 1, 0, _color, 1);
}
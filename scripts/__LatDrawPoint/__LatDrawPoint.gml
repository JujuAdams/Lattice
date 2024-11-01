// Feather disable all

/// @param x
/// @param y
/// @param color
/// @param alpha

function __LatDrawPoint(_x, _y, _color, _alpha)
{
    draw_sprite_ext(__LatPixel, 0, _x, _y, 1, 1, 0, _color, _alpha);
}
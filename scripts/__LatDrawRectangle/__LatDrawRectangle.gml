// Feather disable all

/// @param x
/// @param y
/// @param width
/// @param height
/// @param color

function __LatDrawRectangle(_x, _y, _width, _height, _color)
{
    draw_sprite_ext(__LatPixel, 0, _x, _y, _width, _height, 0, _color, 1);
}
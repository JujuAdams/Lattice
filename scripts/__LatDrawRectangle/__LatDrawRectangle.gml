// Feather disable all

/// @param left
/// @param top
/// @param width
/// @param height
/// @param color
/// @param alpha

function __LatDrawRectangle(_left, _top, _width, _height, _color, _alpha)
{
    draw_sprite_stretched_ext(__LatPixel, 0, _left, _top, _width, _height, _color, _alpha);
}
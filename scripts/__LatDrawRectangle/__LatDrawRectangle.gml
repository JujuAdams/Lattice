// Feather disable all

/// @param x
/// @param y
/// @param width
/// @param height
/// @param rgba

function __LatDrawRectangle(_x, _y, _width, _height, _rgba)
{
    draw_sprite_ext(__LatPixel, 0, _x, _y, _width, _height, 0, _rgba & 0xFFFFFF, (_rgba >> 24) / 255);
}
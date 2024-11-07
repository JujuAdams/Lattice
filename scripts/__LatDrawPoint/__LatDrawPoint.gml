// Feather disable all

/// @param x
/// @param y
/// @param rgba

function __LatDrawPoint(_x, _y, _rgba)
{
    draw_sprite_ext(__LatPixel, 0, _x, _y, 1, 1, 0, _rgba & 0xFFFFFF, (_rgba >> 24) / 255);
}
// Feather disable all

/// @param sprite
/// @param image
/// @param x
/// @param y

function __LatClassSprite(_sprite, _image, _x, _y) constructor
{
    __sprite = _sprite;
    __image  = _image;
    __left   = _x;
    __top    = _y;
    __right  = _x + ceil(sprite_get_width(_sprite) / LATTICE_CELL_WIDTH);
    __bottom = _y + ceil(sprite_get_height(_sprite) / LATTICE_CELL_HEIGHT);
}
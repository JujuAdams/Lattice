// Feather disable all

/// Draws a sprite created by the REXPaint load functions.
/// 
/// @param sprite
/// @param x
/// @param y
/// @param [image=0]

function LatDrawREX(_sprite, _x, _y, _image = 0)
{
    draw_sprite(_sprite, _image, LATTICE_CELL_WIDTH*_x, LATTICE_CELL_HEIGHT*_y);
}
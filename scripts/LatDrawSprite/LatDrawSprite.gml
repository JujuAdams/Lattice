// Feather disable all

/// @param sprite
/// @param image
/// @param x
/// @param y
/// @param fgColor
/// @param [bgColor]

function LatDrawSprite(_sprite, _image, _x, _y, _fgColor, _bgColor = undefined)
{
    if (_bgColor != undefined)
    {
        draw_sprite_ext(__LatPixel, 0,
                        LATTICE_CELL_WIDTH*_x, LATTICE_CELL_HEIGHT*_y,
                        LATTICE_CELL_WIDTH, LATTICE_CELL_HEIGHT, 0,
                        _bgColor, 1);
    }
                    
    draw_sprite_ext(_sprite, _image,
                    LATTICE_CELL_WIDTH*_x, LATTICE_CELL_HEIGHT*_y,
                    1, 1, 0,
                    _fgColor, 1);
}
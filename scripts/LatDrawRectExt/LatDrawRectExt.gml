// Feather disable all

/// @param left
/// @param top
/// @param right
/// @param bottom
/// @param sprite
/// @param image
/// @param fgColor
/// @param [bgColor]

function LatDrawRectExt(_left, _top, _right, _bottom, _sprite, _image, _fgColor, _bgColor = undefined)
{
    if (_bgColor != undefined)
    {
        LatDrawRect(_left, _top, _right, _bottom, _bgColor);
    }
    
    var _y = _top;
    repeat(1 + _bottom - _top)
    {
        var _x = _left;
        repeat(1 + _right - _left)
        {
            draw_sprite_ext(_sprite, _image,
                            LATTICE_CELL_WIDTH*_x, LATTICE_CELL_HEIGHT*_y,
                            1, 1, 0,
                            _fgColor, 1);
            ++_x;
        }
        
        ++_y;
    }
    
}
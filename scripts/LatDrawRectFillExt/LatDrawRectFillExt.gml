// Feather disable all

/// @param left
/// @param top
/// @param right
/// @param bottom
/// @param sprite
/// @param image
/// @param fgColor
/// @param [bgColor]

function LatDrawRectFillExt(_left, _top, _right, _bottom, _sprite, _image, _fgColor, _bgColor = undefined)
{
    if ((_right > _left+1) && (_bottom > _top+1))
    {
        LatDrawRectExt(_left+1, _top+1, _right-1, _bottom-1, _sprite, _image, _fgColor, _bgColor);
    }
}
// Feather disable all

/// @param left
/// @param top
/// @param right
/// @param bottom
/// @param sprite
/// @param image
/// @param fgColor
/// @param [bgColor]

function LatDrawRectEdgeExt(_left, _top, _right, _bottom, _sprite, _image, _fgColor, _bgColor = undefined)
{
    LatDrawRectExt(_left, _top, _right, _top, _sprite, _image, _fgColor, _bgColor);
    
    if (_bottom > _top)
    {
        LatDrawRectExt(_left, _bottom, _right, _bottom, _sprite, _image, _fgColor, _bgColor);
    }
    
    if (_bottom > _top+1)
    {
        LatDrawRectExt(_left, _top+1, _left, _bottom-1, _sprite, _image, _fgColor, _bgColor);
        
        if (_right > _left)
        {
            LatDrawRectExt(_right, _top+1, _right, _bottom-1, _sprite, _image, _fgColor, _bgColor);
        }
    }
}
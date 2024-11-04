// Feather disable all

/// @param left
/// @param top
/// @param right
/// @param bottom
/// @param color

function LatDrawRectFill(_left, _top, _right, _bottom, _color)
{
    if ((_right > _left+1) && (_bottom > _top+1))
    {
        LatDrawRect(_left+1, _top+1, _right-1, _bottom-1, _color);
    }
}
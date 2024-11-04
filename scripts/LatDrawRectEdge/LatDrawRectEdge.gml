// Feather disable all

/// @param left
/// @param top
/// @param right
/// @param bottom
/// @param color

function LatDrawRectEdge(_left, _top, _right, _bottom, _color)
{
    LatDrawRect(_left, _top, _right, _top, _color);
    
    if (_bottom > _top)
    {
        LatDrawRect(_left, _bottom, _right, _bottom, _color);
    }
    
    if (_bottom > _top+1)
    {
        LatDrawRect(_left, _top+1, _left, _bottom-1, _color);
        
        if (_right > _left)
        {
            LatDrawRect(_right, _top+1, _right, _bottom-1, _color);
        }
    }
}
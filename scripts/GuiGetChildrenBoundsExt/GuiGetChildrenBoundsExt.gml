// Feather disable all

/// Returns the bounding box that encompasses all children (inside and outside) of the target
/// instance. The `padding` parameter allows you to add space around the edge of the bounding box.
/// A static struct is returned with the following member variables:
/// 
/// .x:      x-position of the middle of the bounding box
/// .y:      y-position of the middle of the bounding box
/// .width:  width of the bounding box
/// .height: height of the bounding box
/// .left:   x-position of the left of the bounding box
/// .top:    y-position of the top of the bounding box
/// .right:  x-position of the right of the bounding box
/// .bottom: y-position of the bottom of the bounding box
/// 
/// @param padLeft
/// @param padTop
/// @param padRight
/// @param padBottom
/// @param [instance=id]

function GuiGetChildrenBoundsExt(_padLeft, _padTop, _padRight, _padBottom, _instance = id)
{
    static _result = {};
    
    var _empty = true;
    
    with(_instance)
    {
        var _array = __childArray;
        
        if (array_length(_array) > 0)
        {
            _empty = false;
            
            var _left   =  infinity;
            var _top    =  infinity; 
            var _right  = -infinity;
            var _bottom = -infinity;
            
            var _i = 0;
            repeat(array_length(_array))
            {
                with(_array[_i])
                {
                    _left   = min(_left,   x);
                    _top    = min(_top,    y);
                    _right  = max(_right,  x + width-1);
                    _bottom = max(_bottom, y + height-1);
                }
                
                ++_i;
            }
            
            with(_result)
            {
                width  = 1 + _right - _left + _padLeft + _padRight;
                height = 1 + _bottom - _top + _padTop + _padBottom;
                
                left   = _left - _padLeft;
                top    = _top - _padTop;
                right  = _right + _padRight;
                bottom = _bottom + _padBottom;
            }
        }
    }
    
    if (_empty)
    {
        with(_result)
        {
            width  = 1 + _padLeft + _padRight;
            height = 1 + _padTop + _padBottom;
            
            left   = -_padLeft;
            top    = -_padTop;
            right  =  _padRight;
            bottom =  _padBottom;
        }
    }
    
    return _result;
}
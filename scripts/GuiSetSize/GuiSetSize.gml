// Feather disable all

/// Sets the width and height of a GUI instance. If that instance has any children (inside or
/// outside) then the children will follow the parent.
/// 
/// @param width
/// @param height
/// @param [instance=id]
/// @param [hAlign=fa_left]
/// @param [vAlign=fa_top]

function GuiSetSize(_width, _height, _instance = id, _hAlign = fa_left, _vAlign = fa_top)
{
    with(_instance)
    {
        var _dX = 0;
        var _dY = 0;
        
        if (_hAlign == fa_left)
        {
            _dX = (_width - width) div 2;
        }
        else if (_hAlign == fa_right)
        {
            _dX = (width - _width);
        }
        
        if (_vAlign == fa_top)
        {
            _dY = 0.5*(_height - height) div 2;
        }
        else if (_vAlign == fa_bottom)
        {
            _dY = (height - _height);
        }
        
        width  = _width;
        height = _height;
        
        if ((_dX != 0) || (_dY != 0))
        {
            GuiMove(_dX, _dY);
        }
    }
}
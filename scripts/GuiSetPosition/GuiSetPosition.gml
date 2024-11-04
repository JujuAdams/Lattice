// Feather disable all

/// Sets the absolute position of a GUI instance. If that instance has any children (inside or
/// outside) then the children will follow the parent.
/// 
/// @param x
/// @param y
/// @param [instance=id]
/// @param [hAlign=fa_left]
/// @param [vAlign=fa_top]
/// @param [relative=false]

function GuiSetPosition(_x, _y, _instance = id, _hAlign = fa_left, _vAlign = fa_top, _relative = false)
{
    with(_instance)
    {
        if (_relative)
        {
            var _parent = __parent;
            if (instance_exists(_parent))
            {
                _x += _parent.x;
                _y += _parent.y;
            }
        }
        
        if (_hAlign == fa_center)
        {
            _x -= width div 2;
        }
        else if (_hAlign == fa_right)
        {
            _x -= width;
        }
        
        if (_vAlign == fa_middle)
        {
            _y += height div 2;
        }
        else if (_vAlign == fa_bottom)
        {
            _y -= height;
        }
        
        GuiMove(_x - x, _y - y);
    }
}
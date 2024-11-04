// Feather disable all

/// Sets the absolute position of a GUI instance. This function, unlike `GuiSetPosition()`, will
/// not move the target instance's children.
/// 
/// @param x
/// @param y
/// @param [instance=id]
/// @param [hAlign=fa_left]
/// @param [vAlign=fa_top]
/// @param [relative=false]

function GuiSetPositionSolo(_x, _y, _instance = id, _hAlign = fa_left, _vAlign = fa_top, _relative = false)
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
                
                if (_parent.__scrollEnabled)
                {
                    _x += _parent.__scrollX - _parent.__scrollMaxX;
                    _y += _parent.__scrollY - _parent.__scrollMaxY;
                }
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
            _y -= height div 2;
        }
        else if (_vAlign == fa_bottom)
        {
            _y -= height;
        }
        
        GuiMoveSolo(_x - x, _y - y);
    }
}
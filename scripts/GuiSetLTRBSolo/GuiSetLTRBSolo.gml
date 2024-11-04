// Feather disable all

/// Sets the position and size of an instance based on an LTRB bounding box. This function, unlike
/// `GuiSetLTRB()`, will not move the target instance's children.
/// 
/// @param left
/// @param top
/// @param right
/// @param bottom
/// @param [instance=id[

function GuiSetLTRBSolo(_left, _top, _right, _bottom, _instance = id)
{
    with(_instance)
    {
        GuiSetPositionSolo(_left, _top, _instance);
        
        width  = 1 + _right - _left;
        height = 1 + _bottom - _top;
    }
}
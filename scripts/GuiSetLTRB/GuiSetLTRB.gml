// Feather disable all

/// Sets the position and size of an instance based on an LTRB bounding box. If that instance has
/// any children (inside or outside) then the children will follow the parent.
/// 
/// @param left
/// @param top
/// @param right
/// @param bottom
/// @param [instance=id]

function GuiSetLTRB(_left, _top, _right, _bottom, _instance = id)
{
    with(_instance)
    {
        GuiSetPosition(_left, _top, _instance);
        
        width  = 1 + _right - _left;
        height = 1 + _bottom - _top;
    }
}
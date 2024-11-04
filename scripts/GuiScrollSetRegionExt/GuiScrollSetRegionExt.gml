// Feather disable all

/// @param left
/// @param top
/// @param right
/// @param bottom
/// @param [instance=id]

function GuiScrollSetRegionExt(_left, _top, _right, _bottom, _instance = id)
{
    with(_instance)
    {
        GuiScrollSetRegionAbsolute(x + _left, y + _top, x + width-1 - _right, y + height-1 - _bottom);
    }
}
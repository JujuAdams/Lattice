// Feather disable all

/// Sets the position and size of an instance to encapsulate of its children (including "outside"
/// children). The `padding` parameter adds space around the edges of the children.
/// 
/// @param padLeft
/// @param padTop
/// @param padRight
/// @param padBottom
/// @param [instance=id]

function GuiSetSizeAroundChildrenExt(_padLeft, _padTop, _padRight, _padBottom, _instance = id)
{
    var _bounds = GuiGetChildrenBoundsExt(_padLeft, _padTop, _padRight, _padBottom, _instance);
    GuiSetLTRBSolo(_bounds.left, _bounds.top, _bounds.right, _bounds.bottom, _instance);
}
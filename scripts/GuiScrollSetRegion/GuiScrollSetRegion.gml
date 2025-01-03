// Feather disable all

/// Sets up scissoring for an instance. Child instances that are "inside" the parent will have
/// their graphics clipped inside parent instance. The `padding` parameter allows you to make the
/// scissor region smaller than the parent's bounding box with the padding being applied equally
/// in all directions.
/// 
/// @param [padding=0]
/// @param [instance=id]

function GuiScrollSetRegion(_padding = 0, _instance = id)
{
    GuiScrollSetRegionExt(_padding, _padding, _padding, _padding, _instance);
}
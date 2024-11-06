// Feather disable all

// Juju: This is a simple extension of the common parent `GuiParentCommon` that draws a rectangle.
//       It is a useful instance for visually grouping Gui instances.

event_inherited();

if (not variable_instance_exists(id, "padding")) padding = 0;
if (not variable_instance_exists(id, "showScrollbar")) showScrollbar = true;

if ((width == 0) || (width == 0))
{
    show_error($"\n .width and .height must be set\n ", true);
}

handleGrabbed = false;

GuiScrollSetRegionExt(padding, padding, (showScrollbar? 1 : 0) + padding, padding);
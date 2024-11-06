// Feather disable all

// Juju: This is an example UI element that draws text. This object eventually inherits from
//       `GuiObject` which is the common ancestor for the Gui system.

event_inherited();

if (not variable_instance_exists(id, "text")) text = "Example";

// Gui instances will initialize to have a `width` and `height` of 0. If either is zero when this
// event is executed then we set a reasonable default value by using the size of the text label
// that will be drawn on the button.
if (width == 0)
{
    if (not variable_instance_exists(id, "maxWidth")) maxWidth = infinity;
    width = LatTextFormattedGetWidth(text, maxWidth);
}
else
{
    if (not variable_instance_exists(id, "maxWidth")) maxWidth = width;
}

if (height == 0)
{
    height = LatTextFormattedGetHeight(text, maxWidth);
}
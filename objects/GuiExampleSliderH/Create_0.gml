// Feather disable all

// Juju: This is an example of a simple button. You click it, it executes a callback method. This
//       object eventually inherits from `GuiButtonObject` which is the common ancestor for buttons
//       in the Gui system.
//       
//       This event handles initialization for the instance and is executed as soon as the instance
//       is created. User Event 0 (`GUI_USER_EVENT_STEP`) contains code that is executed by
//       `GuiStep()` and User Event 1 (`GUI_USER_EVENT_DRAW`) contains code that is executed by
//       `GuiDraw()`.

event_inherited();

if (not variable_instance_exists(id, "value"    )) value     = 0;
if (not variable_instance_exists(id, "valueMin" )) valueMin  = 0;
if (not variable_instance_exists(id, "valueMax" )) valueMax  = 1;
if (not variable_instance_exists(id, "unit"     )) unit      = 0.1;
if (not variable_instance_exists(id, "arrows"   )) arrows    = true;
if (not variable_instance_exists(id, "func"     )) func      = function() {};
if (not variable_instance_exists(id, "focusable")) focusable = true;

if (focusable)
{
    GuiNavSetFocusable(true);
}
else
{
    GuiNavRaycastSetDisable(true, false);
}

// Gui instances will initialize to have a `width` and `height` of 0. If either is zero when this
// event is executed then we set a reasonable default value by using the size of the text label
// that will be drawn on the button.
if (height == 0) height = 1;
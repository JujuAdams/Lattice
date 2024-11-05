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

if (not variable_instance_exists(id, "fill")) fill = 0;

if (height == 0) height = 1;
/// @desc Step

// Feather disable all

event_inherited();

// Magic function to pass pointer context to the nearest scrollable instance up the Gui inheritance
// stack. This is crucial for creating click-and-drag scrolling.
GuiScrollOnPointer();

// If we have been clicked, execute the callback method
if (GuiNavGetClick())
{
    var _old = RadioButtonGet(group);
    RadioButtonSet(group, index);
    func(_old, index);
}
// Feather disable all

/// Returns whether the navigation mode has been set to `GUI_NAV_TOUCH`.

function GuiNavUsingTouch()
{
    static _system = __GuiSystem();
    
    return (_system.__navMode == GUI_NAV_TOUCH);
}
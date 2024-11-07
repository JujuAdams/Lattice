/// @desc Step

var _oldValue = value;

if (arrows)
{
    var _bodyL = x + 1;
    var _bodyR = x + width-2;
    
    if (GuiNavUsingPointer())
    {
        if (GuiNavGetClick())
        {
            if (GuiNavGetCursorX() == x)
            {
                value = max(value - unit, valueMin);
            }
            else if (GuiNavGetCursorX() == x + width-1)
            {
                value = min(value + unit, valueMax);
            }
        }
        
        if (GuiNavGetOver())
        {
            if (GuiButtonGetPress(GUI_BUTTON_MOUSE_WHEEL_UP))
            {
                value = min(value + unit, valueMax);
            }
            
            if (GuiButtonGetPress(GUI_BUTTON_MOUSE_WHEEL_DOWN))
            {
                value = max(value - unit, valueMin);
            }
        }
    }
}
else
{
    var _bodyL = x;
    var _bodyR = x + width-1;
}

if (GuiNavUsingDirectional() && GuiNavGetOver())
{
    if (focusable)
    {
        if (GuiNavGetClick()) GuiNavToggleFocus();
        if (GuiButtonGetPress("escape")) GuiNavSetFocus(false);
    }
    
    if (((not focusable) && (not GuiNavGetEnter())) || GuiNavGetFocus())
    {
        if (GuiNavGetDX() < 0)
        {
            value = max(value - unit, valueMin);
        }
        else if (GuiNavGetDX() > 0)
        {
            value = min(value + unit, valueMax);
        }
    }
}
else if (GuiNavUsingPointer())
{
    if (GuiNavGetHold() && (GuiNavGetCursorX() >= _bodyL) && (GuiNavGetCursorX() <= _bodyR))
    {
        value = lerp(valueMin, valueMax, clamp((GuiNavGetCursorX() - _bodyL) / (_bodyR - _bodyL), 0, 1));
    }
}

if (_oldValue != value)
{
    value = unit*round((value - valueMin) / unit) + valueMin;
    
    if (_oldValue != value)
    {
        func();
    }
}
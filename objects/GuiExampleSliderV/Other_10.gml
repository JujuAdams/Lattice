/// @desc Step

event_inherited();

var _oldValue = value;

if (arrows)
{
    var _bodyT = y + 1;
    var _bodyB = y + height-2;
    
    if (GuiNavUsingPointer())
    {
        if (GuiNavGetClick())
        {
            if (GuiNavGetCursorY() == y)
            {
                value = max(value + unit, valueMin);
            }
            else if (GuiNavGetCursorY() == y + height-1)
            {
                value = min(value - unit, valueMax);
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
    var _bodyT = y;
    var _bodyB = y + height-1;
}

if (GuiNavUsingDirectional() && GuiNavGetOver())
{
    if (GuiNavGetDY() < 0)
    {
        value = max(value + unit, valueMin);
    }
    else if (GuiNavGetDY() > 0)
    {
        value = min(value - unit, valueMax);
    }
}
else if (GuiNavUsingPointer())
{
    if (GuiNavGetHold() && (GuiNavGetCursorY() >= _bodyT) && (GuiNavGetCursorY() <= _bodyB))
    {
        value = lerp(valueMin, valueMax, clamp((GuiNavGetCursorY() - _bodyB) / (_bodyT - _bodyB), 0, 1));
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
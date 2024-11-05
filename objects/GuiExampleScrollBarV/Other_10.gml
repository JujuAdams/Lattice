/// @desc Step

var _oldValue = value;

if (arrows)
{
    var _bodyT = y + 1;
    var _bodyB = y + height-2;
}
else
{
    var _bodyT = y;
    var _bodyB = y + height-1;
}

var _unit = 1 / max(1, _bodyB - _bodyT);

if (arrows && GuiNavUsingPointer() && (not handleGrabbed))
{
    if (GuiNavGetClick())
    {
        if (GuiNavGetCursorY() == y)
        {
            value = max(value - _unit, valueMin);
        }
        else if (GuiNavGetCursorY() == y + height-1)
        {
            value = min(value + _unit, valueMax);
        }
    }
    
    if (GuiNavGetOver())
    {
        if (GuiButtonGetPress(GUI_BUTTON_MOUSE_WHEEL_UP))
        {
            value = min(value + _unit, valueMax);
        }
        
        if (GuiButtonGetPress(GUI_BUTTON_MOUSE_WHEEL_DOWN))
        {
            value = max(value - _unit, valueMin);
        }
    }
}

var _handlePos = round(lerp(_bodyT, _bodyB, clamp((value - valueMin) / (valueMax - valueMin), 0, 1)));

if (GuiNavUsingDirectional() && GuiNavGetOver())
{
    if (GuiNavGetDY() < 0)
    {
        value = max(value - _unit, valueMin);
    }
    else if (GuiNavGetDY() > 0)
    {
        value = min(value + _unit, valueMax);
    }
}
else if (GuiNavUsingPointer())
{
    if (GuiNavGetCursorY() >= _bodyT) && (GuiNavGetCursorY() <= _bodyB)
    {
        if (GuiNavGetPress() && (GuiNavGetCursorY() == _handlePos))
        {
            handleGrabbed = true;
        }
        else if ((GuiNavGetHold() && handleGrabbed) || GuiNavGetClick())
        {
            value = lerp(valueMin, valueMax, clamp((GuiNavGetCursorY() - _bodyT) / (_bodyB - _bodyT), 0, 1));
        }
    }
}

if (not GuiNavGetHold())
{
    handleGrabbed = false;
}

if (_oldValue != value)
{
    value = _unit*round((value - valueMin) / _unit) + valueMin;
    
    if (_oldValue != value)
    {
        func();
    }
}
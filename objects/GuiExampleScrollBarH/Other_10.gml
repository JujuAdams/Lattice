/// @desc Step

var _oldValue = value;

if (arrows)
{
    var _bodyL = x + 1;
    var _bodyR = x + width-2;
}
else
{
    var _bodyL = x;
    var _bodyR = x + width-1;
}

var _unit = 1 / max(1, _bodyR - _bodyL);

if (arrows && GuiNavUsingPointer() && (not handleGrabbed))
{
    if (GuiNavGetClick())
    {
        if (GuiNavGetCursorX() == x)
        {
            value = max(value - _unit, valueMin);
        }
        else if (GuiNavGetCursorX() == x + width-1)
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

var _handlePos = round(lerp(_bodyL, _bodyR, clamp((value - valueMin) / (valueMax - valueMin), 0, 1)));

if (GuiNavUsingDirectional() && GuiNavGetOver())
{
    if (GuiNavGetDX() < 0)
    {
        value = max(value - _unit, valueMin);
    }
    else if (GuiNavGetDX() > 0)
    {
        value = min(value + _unit, valueMax);
    }
}
else if (GuiNavUsingPointer())
{
    if (GuiNavGetCursorX() >= _bodyL) && (GuiNavGetCursorX() <= _bodyR)
    {
        if (GuiNavGetPress() && (GuiNavGetCursorX() == _handlePos))
        {
            handleGrabbed = true;
        }
        else if ((GuiNavGetHold() && handleGrabbed) || GuiNavGetClick())
        {
            value = lerp(valueMin, valueMax, clamp((GuiNavGetCursorX() - _bodyL) / (_bodyR - _bodyL), 0, 1));
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
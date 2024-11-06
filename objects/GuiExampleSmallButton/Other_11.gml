/// @desc Draw

// Feather disable all

// Juju: Really simple draw code for a button. This is generally applicable for most interactible
//       UI elements.

event_inherited();

var _right   = x + width-1;
var _bottom  = y + height-1;
var _yCenter = y + (height div 2);

if (GuiNavGetHold())
{
    var _fgColor    = C_MONSTER;
    var _bgColor    = C_MALIBU;
    var _arrowColor = C_MONSTER;
}
else if (GuiNavGetOver())
{
    var _fgColor    = C_MALIBU;
    var _bgColor    = C_VENICE;
    var _arrowColor = C_MALIBU;
}
else
{
    var _fgColor    = C_MALIBU;
    var _bgColor    = C_MONSTER;
    var _arrowColor = C_YABBA;
}

LatDrawRect(x, y, _right, _bottom, _bgColor);
LatDrawText(x, _yCenter, "<", _arrowColor);
LatDrawText(_right, _yCenter, ">", _arrowColor);
LatDrawText(x + (width - LatTextGetWidth(text)) div 2, y + (height - LatTextGetHeight(text)) div 2, text, _fgColor);
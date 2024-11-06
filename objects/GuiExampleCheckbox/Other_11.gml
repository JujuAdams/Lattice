/// @desc Draw

// Feather disable all

// Juju: Really simple draw code for a radio button. This is generally applicable for most
//       multi-choice options that need to be listed out in full.

event_inherited();

var _left   = x;
var _top    = y;
var _right  = x + width-1;
var _bottom = y + height-1;

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

if (value)
{
    LatDrawSprite(sFontFull, 251, x+1, y, C_LEMON);
}

LatDrawSprite(sFontFull, 91, x,   y, _arrowColor);
LatDrawSprite(sFontFull, 93, x+2, y, _arrowColor);

LatDrawText(x + 4, y, text, _fgColor, undefined);
/// @desc Draw

// Feather disable all

// Juju: Really simple draw code for a radio button. This is generally applicable for most
//       multi-choice options that need to be listed out in full.

event_inherited();

var _left    = x;
var _top     = y;
var _right   = x + width-1;
var _bottom  = y + height-1;
var _xCenter = _left + (width div 2);

if (GuiNavGetHold())
{
    var _fgColor = C_MONSTER;
    var _bgColor = C_MALIBU;
}
else if (GuiNavGetOver())
{
    var _fgColor = C_MALIBU;
    var _bgColor = C_VENICE;
}
else
{
    var _fgColor = C_MALIBU;
    var _bgColor = C_MONSTER;
}

if (arrows)
{
    var _bodyT = _top+1;
    var _bodyB = _bottom-1;
    
    LatDrawRect(_left, _top, _right, _top, _bgColor);
    LatDrawSprite(sFontFull, 24, _xCenter, _top, _fgColor, _bgColor);
    LatDrawRect(_left, _bottom, _right, _bottom, _bgColor);
    LatDrawSprite(sFontFull, 25, _xCenter, _bottom, _fgColor, _bgColor);
}
else
{
    var _bodyT = _top;
    var _bodyB = _bottom;
}

var _handlePos = round(lerp(_bodyT, _bodyB, clamp((value - valueMin) / (valueMax - valueMin), 0, 1)));

LatDrawRectExt(_left, _bodyT, _right, _handlePos-1, sFontFull, 177, _fgColor, _bgColor);
LatDrawRect(_left, _handlePos, _right, _handlePos, C_MALIBU);
LatDrawRectExt(_left, _handlePos+1, _right, _bodyB, sFontFull, 177, _fgColor, _bgColor);
/// @desc Draw

// Feather disable all

// Juju: Really simple draw code for a radio button. This is generally applicable for most
//       multi-choice options that need to be listed out in full.

event_inherited();

var _left    = x;
var _top     = y;
var _right   = x + width-1;
var _bottom  = y + height-1;
var _xCenter = _left + width div 2;

var _fgColor = GuiNavGetOver()? c_white : c_ltgray;
var _bgColor = (GuiNavGetHold() && GuiNavUsingPointer())? c_gray : c_dkgray;

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

var _handlePos = round(lerp(_bodyB, _bodyT-1, clamp((value - valueMin) / (valueMax - valueMin), 0, 1)));

LatDrawRect(_left, _handlePos+1, _right, _bodyB, _fgColor);
LatDrawRectExt(_left, _bodyT, _right, _handlePos, sFontFull, 177, _fgColor, c_gray);
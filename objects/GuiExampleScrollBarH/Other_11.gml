/// @desc Draw

// Feather disable all

// Juju: Really simple draw code for a radio button. This is generally applicable for most
//       multi-choice options that need to be listed out in full.

event_inherited();

var _left    = x;
var _top     = y;
var _right   = x + width-1;
var _bottom  = y + height-1;
var _yCenter = _top + (height div 2);

var _fgColor = GuiNavGetOver()? c_white : c_ltgray;
var _bgColor = (GuiNavGetHold() && GuiNavUsingPointer())? c_gray : c_dkgray;

if (arrows)
{
    var _bodyL = _left+1;
    var _bodyR = _right-1;
    
    LatDrawRect(_left, _top, _left, _bottom, _bgColor);
    LatDrawSprite(sFontFull, 27, _left,  _yCenter, _fgColor);
    LatDrawRect(_right, _top, _right, _bottom, _bgColor);
    LatDrawSprite(sFontFull, 26, _right, _yCenter, _fgColor);
}
else
{
    var _bodyL = _left;
    var _bodyR = _right;
}

var _handlePos = round(lerp(_bodyL, _bodyR, clamp((value - valueMin) / (valueMax - valueMin), 0, 1)));

LatDrawRectExt(_bodyL, _top, _handlePos-1, _bottom, sFontFull, 177, _fgColor, c_gray);
LatDrawRect(_handlePos, _top, _handlePos, _bottom, _fgColor);
LatDrawRectExt(_handlePos+1, _top, _bodyR, _bottom, sFontFull, 177, _fgColor, c_gray);
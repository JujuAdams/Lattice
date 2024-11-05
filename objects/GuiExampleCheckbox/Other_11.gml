/// @desc Draw

// Feather disable all

// Juju: Really simple draw code for a radio button. This is generally applicable for most
//       multi-choice options that need to be listed out in full.

event_inherited();

var _left   = x;
var _top    = y;
var _right  = x + width-1;
var _bottom = y + height-1;

var _fgColor = GuiNavGetOver()? c_white : c_ltgray;
var _bgColor = (GuiNavGetHold() && GuiNavUsingPointer())? c_gray : c_dkgray;

LatDrawRect(_left, _top, _right, _bottom, _bgColor);
LatDrawSprite(sFontFull, value? 2 : 1, _left, _top, _fgColor, undefined);
LatDrawText(_left + 2, _top, text, _fgColor, undefined);
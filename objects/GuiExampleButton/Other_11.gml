/// @desc Draw

// Feather disable all

// Juju: Really simple draw code for a button. This is generally applicable for most interactible
//       UI elements.

event_inherited();

var _left   = x;
var _top    = y;
var _right  = x + width-1;
var _bottom = y + height-1;

var _fgColor = GuiNavGetOver()? c_white : c_ltgray;
var _bgColor = (GuiNavGetHold() && GuiNavUsingPointer())? c_gray : c_dkgray;

LatDrawBox("test", _left, _top, _right, _bottom, _fgColor, _bgColor, _fgColor, _bgColor);
LatDrawText(_left + (width - LatTextGetWidth(text)) div 2, _top + (height - LatTextGetHeight(text)) div 2, text, _fgColor, _bgColor);
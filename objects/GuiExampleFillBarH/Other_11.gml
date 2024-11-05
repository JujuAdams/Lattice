/// @desc Draw

// Feather disable all

// Juju: Really simple draw code for a radio button. This is generally applicable for most
//       multi-choice options that need to be listed out in full.

event_inherited();

var _left   = x;
var _top    = y;
var _right  = x + width-1;
var _bottom = y + height-1;

var _split = floor(lerp(_left-1, _right, clamp(fill, 0, 1)));

LatDrawRect(_left, _top, _split, _bottom, c_white);
LatDrawRectExt(_split+1, _top, _right, _bottom, sFontFull, 177, c_white, c_gray);
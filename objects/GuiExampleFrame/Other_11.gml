/// @desc Draw

// Feather disable all

event_inherited();

var _left   = x;
var _top    = y;
var _right  = x + width-1;
var _bottom = y + height-1;

LatDrawRectEdgeExt(_left, _top, _right, _bottom, sFontFull, 176, c_white, c_gray);
LatDrawRectFillExt(_left, _top, _right, _bottom, sFontFull, 178, c_white, c_gray);
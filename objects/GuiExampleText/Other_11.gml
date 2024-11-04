/// @desc Draw

// Feather disable all

// Juju: Really simple draw code for text,

event_inherited();

LatDrawText(x + (width - LatTextGetWidth(text)) div 2, y + (height - LatTextGetHeight(text)) div 2, text, c_white, c_black);
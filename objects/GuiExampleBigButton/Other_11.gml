/// @desc Draw

// Feather disable all

// Juju: Really simple draw code for a button. This is generally applicable for most interactible
//       UI elements.

event_inherited();

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

LatDrawBox("test", x, y, x + width-1, y + height-1, _fgColor, _bgColor, _fgColor, _bgColor);
LatDrawText(x + (width - LatTextGetWidth(text)) div 2, y + (height - LatTextGetHeight(text)) div 2, text, _fgColor, _bgColor);
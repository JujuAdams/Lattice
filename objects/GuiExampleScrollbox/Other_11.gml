/// @desc Draw

// Feather disable all

event_inherited();

var _left   = x;
var _top    = y;
var _right  = x + width-1;
var _bottom = y + height-1;

LatDrawRectExt(_left, _top, _right, _bottom, sFontFull, 176, c_white, c_gray);

if (showScrollbar)
{
    var _fgColor = GuiNavGetOver()? c_white : c_ltgray;
    var _bgColor = (GuiNavGetHold() && GuiNavUsingPointer())? c_gray : c_dkgray;
    
    var _bodyX = _right - padding;
    var _bodyT = _top + 1 + padding;
    var _bodyB = _bottom - 1 - padding;
    
    LatDrawSprite(sFontFull, 24, _bodyX, _bodyT-1, _fgColor, _bgColor);
    LatDrawSprite(sFontFull, 25, _bodyX, _bodyB+1, _fgColor, _bgColor);
    
    var _handlePos = round(lerp(_bodyT, _bodyB, GuiScrollGetParamY()));
    
    LatDrawRectExt(_bodyX, _bodyT, _bodyX, _handlePos-1, sFontFull, 177, _fgColor, c_gray);
    LatDrawRect(_bodyX, _handlePos, _bodyX, _handlePos, _fgColor);
    LatDrawRectExt(_bodyX, _handlePos+1, _bodyX, _bodyB, sFontFull, 177, _fgColor, c_gray);
}
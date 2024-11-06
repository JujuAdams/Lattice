/// @desc Draw

// Feather disable all

event_inherited();

var _left   = x;
var _top    = y;
var _right  = x + width-1;
var _bottom = y + height-1;

if (showScrollbar)
{
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
    
    var _bodyX = _right - padding;
    var _bodyT = _top + 1 + padding;
    var _bodyB = _bottom - 1 - padding;
    
    LatDrawSprite(sFontFull, 24, _bodyX, _bodyT-1, _fgColor, _bgColor);
    LatDrawSprite(sFontFull, 25, _bodyX, _bodyB+1, _fgColor, _bgColor);
    
    var _handlePos = round(lerp(_bodyT, _bodyB, GuiScrollGetParamY()));
    
    LatDrawRectExt(_bodyX, _bodyT, _bodyX, _handlePos-1, sFontFull, 177, _fgColor, _bgColor);
    LatDrawRect(_bodyX, _handlePos, _bodyX, _handlePos, C_MALIBU);
    LatDrawRectExt(_bodyX, _handlePos+1, _bodyX, _bodyB, sFontFull, 177, _fgColor, _bgColor);
}
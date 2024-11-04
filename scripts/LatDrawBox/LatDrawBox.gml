// Feather disable all

/// @param patternName
/// @param left
/// @param top
/// @param right
/// @param bottom
/// @param fgColorEdge
/// @param bgColorEdge
/// @param fgColorFill
/// @param bgColorFill

function LatDrawBox(_patternName, _left, _top, _right, _bottom, _fgColorEdge, _bgColorEdge, _fgColorFill, _bgColorFill)
{
    static _boxDict = __LatSystem().__boxDict;
    
    var _boxStruct = _boxDict[$ _patternName];
    if (_boxStruct == undefined)
    {
        __LatError($"Box pattern name \"{_patternName}\" not defined");
    }
    
    var _sprite = _boxStruct.__sprite;
    
    LatDrawRectFillExt(_left, _top, _right, _bottom, _sprite, _boxStruct.__fillImage, _fgColorFill, _bgColorFill);
    
    LatDrawSprite(_sprite, _boxStruct.__tlImage, _left, _top, _fgColorEdge, _bgColorEdge);
    LatDrawRectExt(_left+1, _top, _right-1, _top, _sprite, _boxStruct.__topImage, _fgColorEdge, _bgColorEdge);
    LatDrawSprite(_sprite, _boxStruct.__trImage, _right, _top, _fgColorEdge, _bgColorEdge);
    LatDrawRectExt(_right, _top+1, _right, _bottom-1, _sprite, _boxStruct.__rightImage, _fgColorEdge, _bgColorEdge);
    LatDrawSprite(_sprite, _boxStruct.__brImage, _right, _bottom, _fgColorEdge, _bgColorEdge);
    LatDrawRectExt(_left+1, _bottom, _right-1, _bottom, _sprite, _boxStruct.__bottomImage, _fgColorEdge, _bgColorEdge);
    LatDrawSprite(_sprite, _boxStruct.__blImage, _left, _bottom, _fgColorEdge, _bgColorEdge);
    LatDrawRectExt(_left, _top+1, _left, _bottom-1, _sprite, _boxStruct.__leftImage, _fgColorEdge, _bgColorEdge);
}
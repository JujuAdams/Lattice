// Feather disable all

/// @param patternName
/// @param sprite
/// @param imageFill
/// @param imageTopLeft
/// @param imageTop
/// @param imageTopRight
/// @param imageRight
/// @param imageBottomRight
/// @param imageBottom
/// @param imageBottomLeft
/// @param imageLeft

function LatBoxDefinePattern(_patternName, _sprite, _fillImage, _tlImage, _topImage, _trImage, _rightImage, _brImage, _bottomImage, _blImage, _leftImage)
{
    static _boxDict = __LatSystem().__boxDict;
    
    _boxDict[$ _patternName] = {
        __sprite:      _sprite,
        __fillImage:   _fillImage,
        __tlImage:     _tlImage,
        __topImage:    _topImage,
        __trImage:     _trImage,
        __rightImage:  _rightImage,
        __brImage:     _brImage,
        __bottomImage: _bottomImage,
        __blImage:     _blImage,
        __leftImage:   _leftImage,
    }
}
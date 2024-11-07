// Feather disable all

/// @param sprite
/// @param image
/// @param x
/// @param y
/// @param [fgColor=1]
/// @param [bgColor=0]

function LatSprite(_sprite, _image, _x, _y, _fgColor = c_white, _bgColor = c_black)
{
    static _system    = __LatSystem();
    static _spriteMap = __LatSystem().__spriteMap;
    
    var _spriteData = _spriteMap[? _sprite];
    if (_spriteData == undefined)
    {
        __LatError($"{sprite_get_name(_sprite)} has not been added to Lattice");
    }
    
    var _imageArray = _spriteData.__imageArray;
    
    with(_system.__layerTarget)
    {
        if ((_x >= 0) && (_y >= 0) && (_x < __width) && (_y < __height))
        {
            var _index = _imageArray[floor(max(0, _image mod sprite_get_number(_sprite)))];
            var _symbol = make_color_rgb(_index mod 256, _index div 256, 0);
            
            __symbolGrid[#  _x, _y] = _symbol;
            __bgColorGrid[# _x, _y] = _bgColor;
            __fgColorGrid[# _x, _y] = _fgColor;
            
            surface_set_target(__EnsureSurface());
            __LatDrawPoint(_x,             _y, _symbol);
            __LatDrawPoint(_x +   __width, _y, _bgColor);
            __LatDrawPoint(_x + 2*__width, _y, _fgColor);
            surface_reset_target();
        }
    }
}
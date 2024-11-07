// Feather disable all

/// @param sprite
/// @param image
/// @param x
/// @param y
/// @param [fgColor=white]
/// @param [bgColor=black]

function LatSprite(_sprite, _image, _x, _y, _fgColor = c_white, _bgColor = c_black)
{
    static _system    = __LatSystem();
    static _spriteMap = __LatSystem().__spriteMap;
    
    var _spriteData = _spriteMap[? _sprite];
    if (_spriteData == undefined)
    {
        __LatError($"{sprite_get_name(_sprite)} has not been added to Lattice");
    }
    
    with(_system.__layerTarget)
    {
        if ((_x >= __left) || (_y >= __top) || (_x <= __right) || (_y <= __bottom))
        {
            var _width = __width;
            _x -= __left;
            _y -= __top;
            
            var _index = _spriteData.__imageArray[floor(max(0, _image mod sprite_get_number(_sprite)))];
            var _symbol = make_color_rgb(_index mod 256, _index div 256, 0);
            
            __symbolGrid[#  _x, _y] = _symbol;
            __bgColorGrid[# _x, _y] = _bgColor;
            __fgColorGrid[# _x, _y] = _fgColor;
            
            surface_set_target(__EnsureSurface());
            __LatDrawPoint(_x,            _y, _symbol);
            __LatDrawPoint(_x +   _width, _y, _bgColor);
            __LatDrawPoint(_x + 2*_width, _y, _fgColor);
            surface_reset_target();
        }
    }
}
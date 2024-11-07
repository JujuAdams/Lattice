// Feather disable all

/// @param x
/// @param y
/// @param text
/// @param [fgColor=white]
/// @param [bgColor=black]

function LatText(_x, _y, _text, _fgColor = c_white, _bgColor = c_black)
{
    static _system = __LatSystem();
    
    var _characterMap = _system.__fontCharacterMap;
    if (_characterMap == undefined) return;
    
    with(_system.__layerTarget)
    {
        if ((_x < __left) || (_y < __top) || (_x > __right) || (_y > __bottom))
        {
            return;
        }
        
        var _width = __width;
        _x -= __left;
        _y -= __top;
        
        surface_set_target(__EnsureSurface());
        
        var _i = 1;
        repeat(string_length(_text))
        {
            if (_x >= _width) break;
            
            var _character = string_char_at(_text, _i);
            var _index = _characterMap[? _character] ?? 0;
            var _symbol = make_color_rgb(_index mod 256, _index div 256, 0);
            
            __symbolGrid[#  _x, _y] = _symbol;
            __bgColorGrid[# _x, _y] = _bgColor;
            __fgColorGrid[# _x, _y] = _fgColor;
            
            __LatDrawPoint(_x,            _y, _symbol);
            __LatDrawPoint(_x +   _width, _y, _bgColor);
            __LatDrawPoint(_x + 2*_width, _y, _fgColor);
            
            ++_x;
            ++_i;
        }
        
        surface_reset_target();
    }
}
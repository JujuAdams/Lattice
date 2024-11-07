// Feather disable all

/// @param x
/// @param y
/// @param text
/// @param [fgColor=1]
/// @param [bgColor=0]

function LatText(_x, _y, _text, _fgColor = c_white, _bgColor = c_black)
{
    static _system = __LatSystem();
    
    var _characterMap = _system.__fontCharacterMap;
    if (_characterMap == undefined) return;
    
    with(_system.__layerTarget)
    {
        surface_set_target(__EnsureSurface());
        
        var _i = 1;
        repeat(string_length(_text))
        {
            if ((_x < 0) || (_y < 0) || (_x >= __width) || (_y >= __height))
            {
                break;
            }
            
            var _character = string_char_at(_text, _i);
            var _index = _characterMap[? _character] ?? 0;
            var _symbol = make_color_rgb(_index mod 256, _index div 256, 0);
            
            __symbolGrid[#  _x, _y] = _symbol;
            __bgColorGrid[# _x, _y] = _bgColor;
            __fgColorGrid[# _x, _y] = _fgColor;
            
            __LatDrawPoint(_x,             _y, _symbol);
            __LatDrawPoint(_x +   __width, _y, _bgColor);
            __LatDrawPoint(_x + 2*__width, _y, _fgColor);
            
            ++_x;
            ++_i;
        }
        
        surface_reset_target();
    }
}
// Feather disable all

/// @param x
/// @param y
/// @param text
/// @param [fgPalette=1]
/// @param [bgPalette=0]

function LatText(_x, _y, _text, _foreground = 1, _background = 0)
{
    static _system  = __LatSystem();
    static _fontMap = __LatSystem().__fontMap;
    
    var _characterMap = _system.__fontCharacterMap;
    if (_characterMap == undefined) return;
    
    with(_system.__layerTarget)
    {
        var _i = 1;
        repeat(string_length(_text))
        {
            var _character = string_char_at(_text, _i);
            var _index = _characterMap[? _character] ?? 0;
            
            surface_set_target(__surfaceSymbol);
            gpu_set_blendmode_ext(bm_one, bm_zero);
            draw_set_alpha(_background/255);
            draw_point_color(_x, _y, make_color_rgb(_index mod 256, _index div 256, _foreground));
            draw_set_alpha(1);
            gpu_set_blendmode(bm_normal);
            surface_reset_target();
            
            ++_x;
            ++_i;
        }
    }
}
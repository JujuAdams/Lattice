// Feather disable all

function __LatEnsureSymbolSurface()
{
    static _system = __LatSystem();
    
    var _surface = _system.__symbolsSurface;
    if ((_surface != undefined) && surface_exists(_surface)) return _surface;
    
    with(_system)
    {
        __symbolsSurface = surface_create(LATTICE_SYMBOL_TEXTURE_WIDTH, LATTICE_SYMBOL_TEXTURE_HEIGHT);
        surface_set_target(__symbolsSurface);
        
        draw_clear_alpha(c_black, 0);
        gpu_set_blendmode_ext(bm_one, bm_zero);
        
        var _spriteArray = ds_map_values_to_array(__spriteMap);
        var _fontArray   = ds_map_values_to_array(__fontMap);
        
        var _i = 0;
        repeat(array_length(_spriteArray))
        {
            var _spriteData = _spriteArray[_i];
            var _sprite     = _spriteData.__sprite;
            var _imageArray = _spriteData.__imageArray;
            
            var _j = 0;
            repeat(array_length(_imageArray))
            {
                var _symbolIndex = _imageArray[_j];
                draw_sprite_ext(_sprite, _j, LATTICE_CELL_WIDTH*_symbolIndex, LATTICE_CELL_HEIGHT*0, 1, 1, 0, c_white, 1);
                ++_j;
            }
            
            ++_i;
        }
        
        var _i = 0;
        repeat(array_length(_fontArray))
        {
            var _fontData     = _fontArray[_i];
            var _sprite       = _fontData.__sprite;
            var _mapString    = _fontData.__mapString;
            var _characterMap = _fontData.__characterMap;
            
            var _j = 1;
            repeat(string_length(_mapString))
            {
                var _char = string_char_at(_mapString, _j);
                var _symbolIndex = _characterMap[? _char];
                draw_sprite_ext(_sprite, _j-1, LATTICE_CELL_WIDTH*_symbolIndex, LATTICE_CELL_HEIGHT*0, 1, 1, 0, c_white, 1);
                ++_j;
            }
            
            ++_i;
        }
        
        gpu_set_blendmode(bm_normal);
        surface_reset_target();
        
        return __symbolsSurface;
    }
}
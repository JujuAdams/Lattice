// Feather disable all

/// @param sprite
/// @param mapString

function LatSymbolAddFont(_sprite, _mapString)
{
    static _system = __LatSystem();
    
    __LatEditSymbolSurface();
    
    with(_system)
    {
        var _characterMap = __fontMap[? _sprite];
        if (_characterMap != undefined)
        {
            LatSymbolDeleteFont(_sprite);
        }
        
        if (sprite_get_width(_sprite) > LATTICE_CELL_WIDTH)
        {
            __LatError($"{sprite_get_name(_sprite)} width {sprite_get_width(_sprite)} greater than cell width {LATTICE_CELL_WIDTH}");
        }
        
        if (sprite_get_width(_sprite) > LATTICE_CELL_HEIGHT)
        {
            __LatError($"{sprite_get_name(_sprite)} height {sprite_get_width(_sprite)} greater than cell height {LATTICE_CELL_HEIGHT}");
        }
        
        _characterMap = ds_map_create();
        __fontMap[? _sprite] = _characterMap;
        
        var _xOffset = sprite_get_xoffset(_sprite);
        var _yOffset = sprite_get_yoffset(_sprite);
        
        surface_set_target(__symbolsSurface);
        gpu_set_blendmode_ext(bm_one, bm_zero);
        
        var _i = 0;
        repeat(sprite_get_number(_sprite))
        {
            var _index = __LatFindFreeSymbol();
            _characterMap[? string_char_at(_mapString, _i+1)] = _index;
            
            var _x = (_index mod LATTICE_SYMBOLS_WIDTH)*LATTICE_CELL_WIDTH;
            var _y = (_index div LATTICE_SYMBOLS_WIDTH)*LATTICE_CELL_HEIGHT;
            draw_sprite(_sprite, _i, _x + _xOffset, _y + _yOffset);
            
            ++_i;
        }
        
        gpu_set_blendmode(bm_normal);
        surface_reset_target();
        
        if (__fontSprite == undefined)
        {
            __fontSprite       = _sprite;
            __fontCharacterMap = _characterMap;
        }
    }
}
// Feather disable all

/// @param sprite

function LatSymbolAddSprite(_sprite)
{
    static _system = __LatSystem();
    
    __LatEditSymbolSurface();
    
    with(_system)
    {
        var _imageArray = __spriteMap[? _sprite];
        if (_imageArray != undefined)
        {
            return;
        }
        
        if (sprite_get_width(_sprite) > LATTICE_CELL_WIDTH)
        {
            __LatError($"{sprite_get_name(_sprite)} width {sprite_get_width(_sprite)} greater than cell width {LATTICE_CELL_WIDTH}");
        }
        
        if (sprite_get_width(_sprite) > LATTICE_CELL_HEIGHT)
        {
            __LatError($"{sprite_get_name(_sprite)} height {sprite_get_width(_sprite)} greater than cell height {LATTICE_CELL_HEIGHT}");
        }
        
        _imageArray = array_create(sprite_get_number(_sprite));
        __spriteMap[? _sprite] = {
            __sprite:     _sprite,
            __imageArray: _imageArray,
        };
        
        var _xOffset = sprite_get_xoffset(_sprite);
        var _yOffset = sprite_get_yoffset(_sprite);
        
        surface_set_target(__symbolsSurface);
        gpu_set_blendmode_ext(bm_one, bm_zero);
        
        var _i = 0;
        repeat(sprite_get_number(_sprite))
        {
            var _index = __LatFindFreeSymbol();
            _imageArray[_i] = _index;
            
            var _x = (_index mod LATTICE_SYMBOLS_WIDTH)*LATTICE_CELL_WIDTH;
            var _y = (_index div LATTICE_SYMBOLS_WIDTH)*LATTICE_CELL_HEIGHT;
            draw_sprite(_sprite, _i, _x + _xOffset, _y + _yOffset);
            
            ++_i;
        }
        
        gpu_set_blendmode(bm_normal);
        surface_reset_target();
    }
}
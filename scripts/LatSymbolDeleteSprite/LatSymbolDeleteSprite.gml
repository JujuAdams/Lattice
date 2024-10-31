// Feather disable all

/// @param sprite

function LatSymbolDeleteSprite(_sprite)
{
    static _system = __LatSystem();
    
    __LatEditSymbolSurface();
    
    with(_system)
    {
        var _imageArray = __spriteMap[? _sprite];
        if (_imageArray == undefined) return;
        
        surface_set_target(__symbolsSurface);
        gpu_set_blendmode_ext(bm_one, bm_zero);
        
        var _i = 0;
        repeat(array_length(_imageArray))
        {
            var _index = _imageArray[_i];
            
            var _x = (_index mod LATTICE_SYMBOLS_WIDTH)*LATTICE_CELL_WIDTH;
            var _y = (_index div LATTICE_SYMBOLS_WIDTH)*LATTICE_CELL_HEIGHT;
            __LatDrawRectangle(_x, _y, _x + LATTICE_CELL_WIDTH-1, _y + LATTICE_CELL_HEIGHT-1);
            
            __symbolsFreeArray[_index] = true;
            
            ++_i;
        }
        
        gpu_set_blendmode(bm_normal);
        surface_reset_target();
        
        ds_map_delete(__spriteMap, _sprite);
        __symbolsUsed -= sprite_get_number(_sprite);
    }
}
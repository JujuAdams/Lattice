// Feather disable all

/// @param sprite

function LatSymbolDeleteFont(_sprite)
{
    static _system = __LatSystem();
    
    __LatEditSymbolSurface();
    
    with(_system)
    {
        var _characterMap = __fontMap[? _sprite];
        if (_characterMap == undefined) return;
        
        surface_set_target(__symbolsSurface);
        gpu_set_blendmode_ext(bm_one, bm_zero);
        
        var _valuesArray = ds_map_values_to_array(_characterMap);
        var _i = 0;
        repeat(array_length(_valuesArray))
        {
            var _index = _valuesArray[_i];
            
            var _x = (_index mod LATTICE_SYMBOLS_WIDTH)*LATTICE_CELL_WIDTH;
            var _y = (_index div LATTICE_SYMBOLS_WIDTH)*LATTICE_CELL_HEIGHT;
            __LatDrawRectangle(_x, _y, _x + LATTICE_CELL_WIDTH-1, _y + LATTICE_CELL_HEIGHT-1);
            
            __symbolsFreeArray[_index] = true;
            
            ++_i;
        }
        
        gpu_set_blendmode(bm_normal);
        surface_reset_target();
        
        ds_map_delete(__fontMap, _sprite);
        __symbolsUsed -= array_length(_valuesArray);
    }
}
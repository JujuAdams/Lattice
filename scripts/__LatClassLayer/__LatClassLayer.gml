// Feather disable all

/// @param left
/// @param top
/// @param right
/// @param bottom

function __LatClassLayer(_left, _top, _right, _bottom) constructor
{
    static _system     = __LatSystem();
    static _layerArray = __LatSystem().__layerArray;
    
    array_push(_layerArray, self);
    
    __left   = _left;
    __top    = _top;
    __right  = _right;
    __bottom = _bottom;
    
    __width  = 1 + __right - __left;
    __height = 1 + __bottom - __top;
    
    __symbolGrid  = ds_grid_create(__width, __height);
    __bgColorGrid = ds_grid_create(__width, __height);
    __fgColorGrid = ds_grid_create(__width, __height);
    __surface     = undefined;
    
    ds_grid_clear(__fgColorGrid, 0xFF000000 | c_white);
    
    __EnsureSurface = function()
    {
        if (not surface_exists(__surface))
        {
            __surface = surface_create(3*__width, __height);
            
            surface_set_target(__surface);
            draw_clear_alpha(c_black, 0);
            
            var _y = 0;
            repeat(__height)
            {
                var _x = 0;
                repeat(__width)
                {
                    __LatDrawPoint(_x,             _y, __symbolGrid[#  _x, _y]);
                    __LatDrawPoint(_x +   __width, _y, __bgColorGrid[# _x, _y]);
                    __LatDrawPoint(_x + 2*__width, _y, __fgColorGrid[# _x, _y]);
                    ++_x;
                }
                
                ++_y;
            }
            
            surface_reset_target();
        }
        
        return __surface;
    }
    
    Destroy = function()
    {
        Exists = function() { return false; }
        Destroy = function() {}
        Draw = function() {}
        __EnsureSurface = function() { return undefined; }
        
        ds_grid_destroy(__symbolGrid);
        ds_grid_destroy(__bgColorGrid);
        ds_grid_destroy(__fgColorGrid);
        if (__surface != undefined) surface_free(__surface);
    }
    
    Exists = function()
    {
        return true;
    }
    
    Draw = function(_x, _y)
    {
        static _LatShader_u_vLayerSize         = shader_get_uniform(__LatShader, "u_vLayerSize");
        static _LatShader_u_vCellSize          = shader_get_uniform(__LatShader, "u_vCellSize");
        static _LatShader_u_vSymbolsSize       = shader_get_uniform(__LatShader, "u_vSymbolsSize");
        static _LatShader_u_vSymbolsDimensions = shader_get_uniform(__LatShader, "u_vSymbolsDimensions");
        
        static _LatShader_u_sSymbols = shader_get_sampler_index(__LatShader, "u_sSymbols");
        
        __EnsureSurface();
        var _symbolTexture = surface_get_texture(__LatEnsureSymbolSurface());
        
        shader_set(__LatShader);
        shader_set_uniform_f(_LatShader_u_vLayerSize,         __width, __height);
        shader_set_uniform_f(_LatShader_u_vCellSize,          LATTICE_CELL_WIDTH, LATTICE_CELL_HEIGHT);
        shader_set_uniform_f(_LatShader_u_vSymbolsSize,       LATTICE_SYMBOLS_WIDTH, LATTICE_SYMBOLS_HEIGHT);
        shader_set_uniform_f(_LatShader_u_vSymbolsDimensions, LATTICE_SYMBOL_TEXTURE_WIDTH, LATTICE_SYMBOL_TEXTURE_HEIGHT);
        texture_set_stage(_LatShader_u_sSymbols, _symbolTexture);
        draw_surface_part_ext(__surface,
                              0,  0, __width, __height,
                              _x + __left, _y + __top, 
                              LATTICE_CELL_WIDTH, LATTICE_CELL_HEIGHT,
                              c_white, 1);
        shader_reset();
    }
}
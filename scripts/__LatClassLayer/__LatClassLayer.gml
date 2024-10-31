// Feather disable all

/// @param depth
/// @param left
/// @param top
/// @param right
/// @param bottom

function __LatClassLayer(_depth, _left, _top, _right, _bottom) constructor
{
    static _system     = __LatSystem();
    static _layerArray = __LatSystem().__layerArray;
    
    array_push(_layerArray, self);
    
    visible = true;
    
    __depth  = _depth;
    __left   = _left;
    __top    = _top;
    __right  = _right;
    __bottom = _bottom;
    
    __width  = 1 + __right - __left;
    __height = 1 + __bottom - __top;
    
    __gmLayer = layer_create(__depth);
    
    __gridSymbol    = ds_grid_create(__width, __height);
    __surfaceSymbol = surface_create(__width, __height);
    
    surface_set_target(__surfaceSymbol)
    draw_clear(c_black);
    surface_reset_target();
    
    layer_script_begin(__gmLayer, function()
    {
        static _LatShader_u_vLayerSize         = shader_get_uniform(__LatShader, "u_vLayerSize");
        static _LatShader_u_vCellSize          = shader_get_uniform(__LatShader, "u_vCellSize");
        static _LatShader_u_vSymbolsSize       = shader_get_uniform(__LatShader, "u_vSymbolsSize");
        static _LatShader_u_vSymbolsDimensions = shader_get_uniform(__LatShader, "u_vSymbolsDimensions");
        
        static _LatShader_u_sSymbols = shader_get_sampler_index(__LatShader, "u_sSymbols");
        static _LatShader_u_sPalette = shader_get_sampler_index(__LatShader, "u_sPalette");
        
        if ((event_type == ev_draw) && (event_number = ev_draw_normal))
        {
            if (not visible) return;
            
            shader_set(__LatShader);
            shader_set_uniform_f(_LatShader_u_vLayerSize,         __width, __height);
            shader_set_uniform_f(_LatShader_u_vCellSize,          LATTICE_CELL_WIDTH, LATTICE_CELL_HEIGHT);
            shader_set_uniform_f(_LatShader_u_vSymbolsSize,       LATTICE_SYMBOLS_WIDTH, LATTICE_SYMBOLS_HEIGHT);
            shader_set_uniform_f(_LatShader_u_vSymbolsDimensions, LATTICE_SYMBOL_TEXTURE_WIDTH, LATTICE_SYMBOL_TEXTURE_HEIGHT);
            texture_set_stage(_LatShader_u_sPalette, surface_get_texture(_system.__paletteSurface));
            texture_set_stage(_LatShader_u_sSymbols, _system.__symbolsTexture);
            draw_surface_stretched(__surfaceSymbol,
                                   LATTICE_CELL_WIDTH*__left,  LATTICE_CELL_HEIGHT*__top,
                                   LATTICE_CELL_WIDTH*__width, LATTICE_CELL_HEIGHT*__height);
            shader_reset();
        }
    });
    
    Destroy = function()
    {
        Exists = function() { return false; }
        Destroy = function() {}
        
        layer_destroy(__gmLayer);
        
        ds_grid_destroy(__gridSymbol);
        surface_free(__surfaceSymbol);
    }
    
    Exists = function()
    {
        return true;
    }
}
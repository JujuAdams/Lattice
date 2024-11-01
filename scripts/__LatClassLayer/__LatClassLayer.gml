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
    
    __spriteSurface    = undefined;
    __foreColorSurface = undefined;
    __backColorSurface = undefined;
    
    __spriteRefGrid = ds_grid_create(__width, __height);
    __foreColorGrid = ds_grid_create(__width, __height);
    __backColorGrid = ds_grid_create(__width, __height);
    
    ds_grid_clear(__spriteRefGrid, undefined);
    ds_grid_clear(__foreColorGrid, 0xFF000000 | c_white);
    ds_grid_clear(__backColorGrid, 0xFF000000 | c_black);
    
    
    
    layer_script_begin(__gmLayer, function()
    {
        static _u_sForeground = shader_get_sampler_index(__LatShader, "u_sForeground");
        
        if ((event_type == ev_draw) && (event_number = ev_draw_normal))
        {
            if (not visible) return;
            
            draw_surface_stretched(__EnsureBackgroundSurface(), LATTICE_CELL_WIDTH*__left, LATTICE_CELL_HEIGHT*__top, LATTICE_CELL_WIDTH*__width, LATTICE_CELL_HEIGHT*__height);
            
            shader_set(__LatShader);
            texture_set_stage(_u_sForeground, surface_get_texture(__EnsureForegroundSurface()));
            draw_surface_stretched(__EnsureSpriteSurface(), LATTICE_CELL_WIDTH*__left, LATTICE_CELL_HEIGHT*__top, LATTICE_CELL_WIDTH*__width, LATTICE_CELL_HEIGHT*__height);
            shader_reset();
            
            //draw_surface_stretched(__EnsureBackgroundSurface(), LATTICE_CELL_WIDTH*__left, LATTICE_CELL_HEIGHT*__top, LATTICE_CELL_WIDTH*__width, LATTICE_CELL_HEIGHT*__height);
        }
    });
    
    Destroy = function()
    {
        Exists = function() { return false; }
        Destroy = function() {}
        __EnsureSpriteSurface     = function() {}
        __EnsureForegroundSurface = function() {}
        __EnsureBackgroundSurface = function() {}
        
        layer_destroy(__gmLayer);
        
        if (__spriteSurface = undefined)
        {
            surface_free(__spriteSurface);
            __spriteSurface = undefined;
        }
        
        if (__foreColorSurface = undefined)
        {
            surface_free(__foreColorSurface);
            __foreColorSurface = undefined;
        }
        
        if (__backColorSurface = undefined)
        {
            surface_free(__backColorSurface);
            __backColorSurface = undefined;
        }
        
        ds_grid_destroy(__spriteRefGrid);
        ds_grid_destroy(__foreColorGrid);
        ds_grid_destroy(__backColorGrid);
    }
    
    Exists = function()
    {
        return true;
    }
    
    __EnsureSpriteSurface = function()
    {
        if ((__spriteSurface != undefined) && surface_exists(__spriteSurface)) return __spriteSurface;
        
        __spriteSurface = surface_create(LATTICE_CELL_WIDTH*__width, LATTICE_CELL_HEIGHT*__height);
        
        surface_set_target(__spriteSurface);
        draw_clear_alpha(c_black, 0);
        
        var _cellY = 0;
        repeat(__height)
        {
            var _cellX = 0;
            repeat(__width)
            {
                var _struct = __spriteRefGrid[# _cellX, _cellY];
                if (_struct != undefined)
                {
                    var _sprite  = _struct.__sprite;
                    var _image   = _struct.__image;
                    var _spriteL = _struct.__left;
                    var _spriteT = _struct.__top;
                    
                    draw_sprite_part(_sprite, _image, LATTICE_CELL_WIDTH*(_cellX - _spriteL), LATTICE_CELL_HEIGHT*(_cellY - _spriteT), LATTICE_CELL_WIDTH, LATTICE_CELL_HEIGHT, LATTICE_CELL_WIDTH*_cellX, LATTICE_CELL_HEIGHT*_cellY);
                }
                
                ++_cellX;
            }
            
            ++_cellY;
        }
        
        surface_reset_target();
        
        return __spriteSurface;
    }
    
    __EnsureForegroundSurface = function()
    {
        if ((__foreColorSurface != undefined) && surface_exists(__foreColorSurface)) return __foreColorSurface;
        
        __foreColorSurface = surface_create(__width, __height);
        
        var _oldAlpha = draw_get_alpha();
        gpu_set_blendmode_ext(bm_one, bm_zero);
        
        surface_set_target(__foreColorSurface);
        draw_clear(c_black);
        
        var _y = 0;
        repeat(__height)
        {
            var _x = 0;
            repeat(__width)
            {
                var _rgba = __foreColorGrid[# _x, _y];
                __LatDrawPoint(_x, _y, _rgba & 0x00FFFFFF, (_rgba >> 24) / 255);
                ++_x;
            }
            
            ++_y;
        }
        
        surface_reset_target();
        
        gpu_set_blendmode(bm_normal);
        draw_set_alpha(_oldAlpha);
        
        return __foreColorSurface;
    }
    
    __EnsureBackgroundSurface = function()
    {
        if ((__backColorSurface != undefined) && surface_exists(__backColorSurface)) return __backColorSurface;
        
        __backColorSurface = surface_create(__width, __height);
        
        var _oldAlpha = draw_get_alpha();
        gpu_set_blendmode_ext(bm_one, bm_zero);
        
        surface_set_target(__backColorSurface);
        draw_clear(c_black);
        
        var _y = 0;
        repeat(__height)
        {
            var _x = 0;
            repeat(__width)
            {
                var _rgba = __backColorGrid[# _x, _y];
                __LatDrawPoint(_x, _y, _rgba & 0x00FFFFFF, (_rgba >> 24) / 255);
                ++_x;
            }
            
            ++_y;
        }
        
        surface_reset_target();
        
        gpu_set_blendmode(bm_normal);
        draw_set_alpha(_oldAlpha);
        
        return __backColorSurface;
    }
}
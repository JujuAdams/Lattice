// Feather disable all

/// @param color
/// @param [left]
/// @param [top]
/// @param [width]
/// @param [height]
/// @param [alpha=1]

function LatBackground(_color, _left = undefined, _top = undefined, _width = undefined, _height = undefined, _alpha = 1)
{
    static _system = __LatSystem();
    
    with(_system.__layerTarget)
    {
        _left   = (_left   == undefined)? 0 : (_left - __left);
        _top    = (_top    == undefined)? 0 : (_top - __top);
        _width  = (_width  == undefined)? __width : _width;
        _height = (_height == undefined)? __height : _height;
        
        _color |= (255*_alpha) << 24;
        ds_grid_set_region(__bgColorGrid, _left, _top, _left + _width-1, _top + _height-1, _color);
        
        surface_set_target(__EnsureSurface());
        gpu_set_blendmode_ext(bm_one, bm_zero);
        __LatDrawRectangle(_left + __width, _top, _width, _height, _color);
        gpu_set_blendmode(bm_normal);
        surface_reset_target();
    }
}
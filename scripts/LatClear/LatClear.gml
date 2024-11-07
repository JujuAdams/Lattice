// Feather disable all

/// @param [left]
/// @param [top]
/// @param [width]
/// @param [height]

function LatClear(_left = undefined, _top = undefined, _width = undefined, _height = undefined)
{
    static _system = __LatSystem();
    
    with(_system.__layerTarget)
    {
        _left   = (_left   == undefined)? 0 : (_left - __left);
        _top    = (_top    == undefined)? 0 : (_top - __top);
        _width  = (_width  == undefined)? __width : _width;
        _height = (_height == undefined)? __height : _height;
        
        ds_grid_set_region(__symbolGrid,  _left, _top, _left + _width-1, _top + _height-1, 0);
        ds_grid_set_region(__bgColorGrid, _left, _top, _left + _width-1, _top + _height-1, 0);
        ds_grid_set_region(__fgColorGrid, _left, _top, _left + _width-1, _top + _height-1, 0);
        
        surface_set_target(__EnsureSurface());
        gpu_set_blendmode_ext(bm_one, bm_zero);
        __LatDrawRectangle(_left,             _top, _width, _height, 0);
        __LatDrawRectangle(_left +   __width, _top, _width, _height, 0);
        __LatDrawRectangle(_left + 2*__width, _top, _width, _height, 0);
        gpu_set_blendmode(bm_normal);
        surface_reset_target();
    }
}
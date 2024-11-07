// Feather disable all

/// @param color
/// @param [left]
/// @param [top]
/// @param [width]
/// @param [height]

function LatForeground(_color, _left = undefined, _top = undefined, _width = undefined, _height = undefined)
{
    static _system = __LatSystem();
    
    with(_system.__layerTarget)
    {
        _left   = (_left   == undefined)? 0 : (_left - __left);
        _top    = (_top    == undefined)? 0 : (_top - __top);
        _width  = (_width  == undefined)? __width : _width;
        _height = (_height == undefined)? __height : _height;
        
        _color |= 0xFF000000;
        
        ds_grid_set_region(__fgColorGrid, _left, _top, _left + _width-1, _top + _height-1, _color);
        
        surface_set_target(__EnsureSurface());
        __LatDrawRectangle(_left + 2*__width, _top, _width, _height, _color);
        surface_reset_target();
    }
}
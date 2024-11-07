// Feather disable all

/// @param left
/// @param top
/// @param width
/// @param height
/// @param color

function LatForeground(_left, _top, _width, _height, _color)
{
    static _system = __LatSystem();
    
    with(_system.__layerTarget)
    {
        _left -= __left;
        _top  -= __top;
        
        ds_grid_set_region(__fgColorGrid, _left, _top, _left + _width-1, _top + _height-1, _color);
        
        surface_set_target(__surface);
        __LatDrawRectangle(_left + 2*__width, _top, _width, _height, _color);
        surface_reset_target();
    }
}
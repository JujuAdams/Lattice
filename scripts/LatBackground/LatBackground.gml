// Feather disable all

/// @param color
/// @param left
/// @param top
/// @param width
/// @param height

function LatBackground(_color, _left, _top, _width, _height)
{
    static _system = __LatSystem();
    
    with(_system.__layerTarget)
    {
        ds_grid_set_region(__backColorGrid, _left, _top, _left + _width-1, _top + _height-1, 0xFF000000 | _color);
        
        surface_set_target(__EnsureBackgroundSurface());
        __LatDrawRectangle(_left, _top, _width, _height, _color, 1);
        surface_reset_target();
    }
}
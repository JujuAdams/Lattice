// Feather disable all

/// @param paletteIndex
/// @param left
/// @param top
/// @param width
/// @param height

function LatBackground(_paletteIndex, _left, _top, _width, _height)
{
    static _system = __LatSystem();
    
    with(_system.__layerTarget)
    {
        surface_set_target(__surfaceSymbol);
        gpu_set_blendmode_ext(bm_one, bm_zero);
        gpu_set_colorwriteenable(false, false, false, true);
        draw_set_alpha(_paletteIndex/255);
        
        __LatDrawRectangle(_left, _top, _left + _width-1, _top + _height-1);
        
        gpu_set_blendmode(bm_normal);
        gpu_set_colorwriteenable(true, true, true, true);
        draw_set_alpha(1);
        surface_reset_target();
    }
}
// Feather disable all

/// @param sprite
/// @param image
/// @param x
/// @param y
/// @param [fgPalette=1]
/// @param [bgPalette=0]

function LatSprite(_sprite, _image, _x, _y, _foreground = 1, _background = 0)
{
    static _system    = __LatSystem();
    static _spriteMap = __LatSystem().__spriteMap;
    
    var _imageArray = _spriteMap[? _sprite];
    if (_imageArray == undefined)
    {
        __LatError($"{sprite_get_name(_sprite)} has not been added to Lattice");
    }
    
    with(_system.__layerTarget)
    {
        var _index = _imageArray[floor(max(0, _image mod sprite_get_number(_sprite)))];
        
        surface_set_target(__surfaceSymbol);
        gpu_set_blendmode_ext(bm_one, bm_zero);
        draw_set_alpha(_background/255);
        draw_point_color(_x, _y, make_color_rgb(_index mod 256, _index div 256, _foreground));
        draw_set_alpha(1);
        gpu_set_blendmode(bm_normal);
        surface_reset_target();
    }
}
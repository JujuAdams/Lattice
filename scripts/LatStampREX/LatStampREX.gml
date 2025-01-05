// Feather disable all

/// Draws a REXPaint image to a Lattice layer. The target should have been previously set by
/// `LatLayerSetTarget()`.
/// 
/// @param sprite
/// @param x
/// @param y
/// @param [image=0]

function LatStampREX(_sprite, _x, _y, _image = 0)
{
    static _system = __LatSystem();
    
    with(_system.__layerTarget)
    {
        _x -= floor(sprite_get_xoffset(_sprite) / LATTICE_CELL_WIDTH);
        _y -= floor(sprite_get_yoffset(_sprite) / LATTICE_CELL_HEIGHT);
        
        var _cellW = ceil(sprite_get_width(_sprite) / LATTICE_CELL_WIDTH);
        var _cellH = ceil(sprite_get_height(_sprite) / LATTICE_CELL_HEIGHT);
        
        var _new = new __LatClassSprite(_sprite, _image, _x, _y);
        ds_grid_set_region(__spriteRefGrid, _new.__left, _new.__top, _new.__right, _new.__bottom, _new);
        
        surface_set_target(__EnsureSpriteSurface());
        
        gpu_set_blendmode_ext(bm_one, bm_zero);
        draw_sprite(_sprite, _image, LATTICE_CELL_WIDTH*_x + sprite_get_xoffset(_sprite), LATTICE_CELL_HEIGHT*_y + sprite_get_yoffset(_sprite));
        gpu_set_blendmode(bm_normal);
        
        surface_reset_target();
        
        LatStampFg(c_white, _x, _y, _cellW, _cellH);
        LatStampBg(c_black, _x, _y, _cellW, _cellH);
    }
}
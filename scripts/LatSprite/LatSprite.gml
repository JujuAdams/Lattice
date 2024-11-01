// Feather disable all

/// @param sprite
/// @param image
/// @param x
/// @param y
/// @param [fgColor]
/// @param [bgColor]

function LatSprite(_sprite, _image, _x, _y, _foreground = undefined, _background = undefined)
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
        
        if (not LATTICE_TEXTURE_GROUP_CROPPED)
        {
            
            gpu_set_blendmode(bm_subtract);
            __LatDrawRectangle(LATTICE_CELL_WIDTH*_x, LATTICE_CELL_HEIGHT*_y, LATTICE_CELL_WIDTH*_cellW, LATTICE_CELL_HEIGHT*_cellH, c_white, 1);
            gpu_set_blendmode(bm_normal);
        }
        
        gpu_set_blendmode_ext(bm_one, bm_zero);
        draw_sprite(_sprite, _image, LATTICE_CELL_WIDTH*_x + sprite_get_xoffset(_sprite), LATTICE_CELL_HEIGHT*_y + sprite_get_yoffset(_sprite));
        gpu_set_blendmode(bm_normal);
        
        surface_reset_target();
        
        if (_foreground != undefined)
        {
            LatForeground(_foreground, _x, _y, _cellW, _cellH);
        }
        
        if (_background != undefined)
        {
            LatBackground(_background, _x, _y, _cellW, _cellH);
        }
    }
}
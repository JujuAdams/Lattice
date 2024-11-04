// Feather disable all

/// @param x
/// @param y
/// @param text
/// @param [fgColor]
/// @param [bgColor]

function LatText(_x, _y, _text, _fgColor = undefined, _bgColor = undefined)
{
    static _system = __LatSystem();
    
    with(_system.__layerTarget)
    {
        var _sprite    = _system.__fontInfo.spriteIndex;
        var _glyphDict = _system.__fontInfo.glyphs;
        
        _x -= floor(sprite_get_xoffset(_sprite) / LATTICE_CELL_WIDTH);
        _y -= floor(sprite_get_yoffset(_sprite) / LATTICE_CELL_HEIGHT);
        
        var _cellW = ceil(sprite_get_width(_sprite) / LATTICE_CELL_WIDTH);
        var _cellH = ceil(sprite_get_height(_sprite) / LATTICE_CELL_HEIGHT);
        
        surface_set_target(__EnsureSpriteSurface());
        
        if (not LATTICE_TEXTURE_GROUP_CROPPED)
        {
            gpu_set_blendmode(bm_subtract);
            __LatDrawRectangle(LATTICE_CELL_WIDTH*_x, LATTICE_CELL_HEIGHT*_y, LATTICE_CELL_WIDTH*_cellW*string_length(_text), LATTICE_CELL_HEIGHT*_cellH, c_white, 1);
            gpu_set_blendmode(bm_normal);
        }
        
        gpu_set_blendmode_ext(bm_one, bm_zero);
        
        var _cellX = _x;
        var _i = 1;
        repeat(string_length(_text))
        {
            var _character = string_char_at(_text, _i);
            var _glyphData = _glyphDict[$ _character];
            var _image = _glyphData.char;
            
            var _new = new __LatClassSprite(_sprite, _image, _cellX, _y);
            ds_grid_set_region(__spriteRefGrid, _new.__left, _new.__top, _new.__right, _new.__bottom, _new);
            
            draw_sprite(_sprite, _image, LATTICE_CELL_WIDTH*_cellX + sprite_get_xoffset(_sprite), LATTICE_CELL_HEIGHT*_y + sprite_get_yoffset(_sprite));
            
            _cellX += _cellW;
            ++_i;
        }
        
        gpu_set_blendmode(bm_normal);
        
        surface_reset_target();
        
        if (_fgColor != undefined)
        {
            LatForeground(_fgColor, _x, _y, _cellW*string_length(_text), _cellH);
        }
        
        if (_bgColor != undefined)
        {
            LatBackground(_bgColor, _x, _y, _cellW*string_length(_text), _cellH);
        }
    }
}
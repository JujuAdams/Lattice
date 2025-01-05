// Feather disable all

/// Generates a sprite from a REXPaint image file, processing layers such that the final sprite
/// has one subimage per layer. A `symbolSprite` must be provided. For accurate results, the images
/// in the `symbolSprite` must match the characters used in REXPaint to create the image.
/// Transparency can be set for the bottom layer independently of other layers.
/// 
/// @param path
/// @param symbolSprite
/// @param transparentBottom
/// @param transparentLayers

function LatREXLoadLayers(_path, _symbolSprite, _transparentBottom, _transparentLayers)
{
    static _system = __LatSystem();
    static _surface = -1;
    
    var _buffer = __LatGzipUnzipFile(_path);
    
    var _version = buffer_read(_buffer, buffer_s32);
    if (_version != -1)
    {
        buffer_delete(_buffer);
        __LatError($"Error when loading {_path}\nUnexpected version {_version}, was expecting -1");
        return undefined;
    }
    
    var _layerCount = buffer_read(_buffer, buffer_u32);
    
    //Peek at the size of the first layer. All layers should be the same size
    var _documentWidth  = buffer_peek(_buffer, buffer_tell(_buffer),   buffer_u32);
    var _documentHeight = buffer_peek(_buffer, buffer_tell(_buffer)+4, buffer_u32);
    
    var _surfaceWidth  = _documentWidth*LATTICE_CELL_WIDTH;
    var _surfaceHeight = _documentHeight*LATTICE_CELL_HEIGHT;
    
    if (not surface_exists(_surface))
    {
        _surface = surface_create(_surfaceWidth, _surfaceHeight);
    }
    else if ((surface_get_width(_surface) < _surfaceWidth) || (surface_get_height(_surface) < _surfaceHeight))
    {
        surface_free(_surface);
        _surface = surface_create(_surfaceWidth, _surfaceHeight);
    }
    
    var _sprite = -1;
    
    if (_layerCount <= 0)
    {
        __LatTrace("Warning when loading {_path}: No layers found");
    }
    else
    {
        var _layer = 0;
        repeat(_layerCount)
        {
            surface_set_target(_surface);
            draw_clear_alpha(c_black, ((_layer == 0)? _transparentBottom : _transparentLayers)? 0 : 1);
            
            var _layerWidth  = buffer_read(_buffer, buffer_u32);
            var _layerHeight = buffer_read(_buffer, buffer_u32);
            
            //Safety check for layer dimensions
            if (_layerWidth != _documentWidth)
            {
                __LatError($"Error when loading {_path}\nLayer width mismatch. Found {_layerWidth} for layer index {_layer}, was expecting {_documentWidth}");
                return undefined;
            }
            
            if (_layerHeight != _documentHeight)
            {
                __LatError($"Error when loading {_path}\nLayer height mismatch. Found {_layerHeight} for layer index {_layer}, was expecting {_documentHeight}");
                return undefined;
            }
            
            var _y = 0;
            repeat(_layerHeight)
            {
                var _x = 0;
                repeat(_layerWidth)
                {
                    var _unicode = buffer_read(_buffer, buffer_u32);
                    
                    var _fgRed   = buffer_read(_buffer, buffer_u8);
                    var _fgGreen = buffer_read(_buffer, buffer_u8);
                    var _fgBlue  = buffer_read(_buffer, buffer_u8);
                    
                    var _bgRed   = buffer_read(_buffer, buffer_u8);
                    var _bgGreen = buffer_read(_buffer, buffer_u8);
                    var _bgBlue  = buffer_read(_buffer, buffer_u8);
                    
                    if ((_bgRed == 255) && (_bgGreen == 0) && (_bgBlue == 255))
                    {
                        //Source cell is transparent
                    }
                    else
                    {
                        draw_sprite_ext(__LatPixel, 0, _x, _y, LATTICE_CELL_WIDTH, LATTICE_CELL_HEIGHT, 0, (_bgBlue << 16) | (_bgGreen << 8) | _bgRed, 1);
                        draw_sprite_ext(_symbolSprite, _unicode, _x, _y, 1, 1, 0, (_fgBlue << 16) | (_fgGreen << 8) | _fgRed, 1);
                    }
                    
                    _x += LATTICE_CELL_WIDTH;
                }
            
                _y += LATTICE_CELL_HEIGHT;
            }
            
            gpu_set_blendmode(bm_normal);
            surface_reset_target();
            
            if (_layer == 0)
            {
                _sprite = sprite_create_from_surface(_surface, 0, 0, _surfaceWidth, _surfaceHeight, false, false, 0, 0);
            }
            else
            {
                sprite_add_from_surface(_sprite, _surface, 0, 0, _surfaceWidth, _surfaceHeight, false, false);
            }
            
            ++_layer;
        }
    }
    
    buffer_delete(_buffer);
    
    return _sprite;
}
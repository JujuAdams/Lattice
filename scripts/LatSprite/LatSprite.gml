// Feather disable all

/// @param sprite
/// @param image
/// @param x
/// @param y
/// @param [fgColor=c_white]
/// @param [bgColor=c_black]

function LatSprite(_sprite, _image, _x, _y, _foreground = c_white, _background = c_black)
{
    static _system = __LatSystem();
    
    with(_system.__layerTarget)
    {
        _foreground = 0xFF000000 | _foreground;
        _background = 0xFF000000 | _background;
        
        var _spriteUVs = sprite_get_uvs(_sprite, _image);
        var _u0 = _spriteUVs[0];
        var _v0 = _spriteUVs[1];
        var _u1 = _spriteUVs[2];
        var _v1 = _spriteUVs[3];
        var _l  = _x*LATTICE_CELL_WIDTH  + _spriteUVs[4];
        var _t  = _y*LATTICE_CELL_HEIGHT + _spriteUVs[5];
        var _r  = _l + sprite_get_width( _sprite)*_spriteUVs[6];
        var _b  = _t + sprite_get_height(_sprite)*_spriteUVs[7];
        
        var _buffer = __buffer;
        buffer_seek(_buffer, buffer_seek_start, __ReserveSymbol(_x, _y));
        
        buffer_write(_buffer, buffer_f32, _l); buffer_write(_buffer, buffer_f32, _t); buffer_write(_buffer, buffer_f32, 0); buffer_write(_buffer, buffer_u32, _foreground); buffer_write(_buffer, buffer_u32, _background); buffer_write(_buffer, buffer_f32, _u0); buffer_write(_buffer, buffer_f32, _v0);
        buffer_write(_buffer, buffer_f32, _r); buffer_write(_buffer, buffer_f32, _t); buffer_write(_buffer, buffer_f32, 0); buffer_write(_buffer, buffer_u32, _foreground); buffer_write(_buffer, buffer_u32, _background); buffer_write(_buffer, buffer_f32, _u1); buffer_write(_buffer, buffer_f32, _v0);
        buffer_write(_buffer, buffer_f32, _l); buffer_write(_buffer, buffer_f32, _b); buffer_write(_buffer, buffer_f32, 0); buffer_write(_buffer, buffer_u32, _foreground); buffer_write(_buffer, buffer_u32, _background); buffer_write(_buffer, buffer_f32, _u0); buffer_write(_buffer, buffer_f32, _v1);
                                                                                                                                                                            
        buffer_write(_buffer, buffer_f32, _r); buffer_write(_buffer, buffer_f32, _t); buffer_write(_buffer, buffer_f32, 0); buffer_write(_buffer, buffer_u32, _foreground); buffer_write(_buffer, buffer_u32, _background); buffer_write(_buffer, buffer_f32, _u1); buffer_write(_buffer, buffer_f32, _v0);
        buffer_write(_buffer, buffer_f32, _l); buffer_write(_buffer, buffer_f32, _b); buffer_write(_buffer, buffer_f32, 0); buffer_write(_buffer, buffer_u32, _foreground); buffer_write(_buffer, buffer_u32, _background); buffer_write(_buffer, buffer_f32, _u0); buffer_write(_buffer, buffer_f32, _v1);
        buffer_write(_buffer, buffer_f32, _r); buffer_write(_buffer, buffer_f32, _b); buffer_write(_buffer, buffer_f32, 0); buffer_write(_buffer, buffer_u32, _foreground); buffer_write(_buffer, buffer_u32, _background); buffer_write(_buffer, buffer_f32, _u1); buffer_write(_buffer, buffer_f32, _v1);
    }
}
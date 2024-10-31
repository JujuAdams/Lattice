// Feather disable all

/// @param color
/// @param left
/// @param top
/// @param width
/// @param height

function LatForeground(_color, _left, _top, _width, _height)
{
    static _system = __LatSystem();
    
    with(_system.__layerTarget)
    {
        _color = 0xFF000000 | _color;
        
        var _y = _top;
        repeat(_height)
        {
            var _x = _left;
            repeat(_width)
            {
                var _buffer = __buffer;
                
                var _pos = __vbPosGrid[# _x, _y];
                if (_pos == undefined)
                {
                    _pos = __ReserveSymbol(_x, _y);
                    
                    var _l = LATTICE_CELL_WIDTH*_left;
                    var _t = LATTICE_CELL_HEIGHT*_top;
                    var _r = _l + LATTICE_CELL_WIDTH;
                    var _b = _t + LATTICE_CELL_HEIGHT;
                    
                    buffer_seek(_buffer, buffer_seek_start, _pos);
                    
                    buffer_write(_buffer, buffer_f32, _l); buffer_write(_buffer, buffer_f32, _t); buffer_write(_buffer, buffer_f32, 0); buffer_write(_buffer, buffer_u32, _color); buffer_write(_buffer, buffer_u32, 0xFFFFFFFF); buffer_write(_buffer, buffer_f32, 0); buffer_write(_buffer, buffer_f32, 0);
                    buffer_write(_buffer, buffer_f32, _r); buffer_write(_buffer, buffer_f32, _t); buffer_write(_buffer, buffer_f32, 0); buffer_write(_buffer, buffer_u32, _color); buffer_write(_buffer, buffer_u32, 0xFFFFFFFF); buffer_write(_buffer, buffer_f32, 0); buffer_write(_buffer, buffer_f32, 0);
                    buffer_write(_buffer, buffer_f32, _l); buffer_write(_buffer, buffer_f32, _b); buffer_write(_buffer, buffer_f32, 0); buffer_write(_buffer, buffer_u32, _color); buffer_write(_buffer, buffer_u32, 0xFFFFFFFF); buffer_write(_buffer, buffer_f32, 0); buffer_write(_buffer, buffer_f32, 0);
                    
                    buffer_write(_buffer, buffer_f32, _r); buffer_write(_buffer, buffer_f32, _t); buffer_write(_buffer, buffer_f32, 0); buffer_write(_buffer, buffer_u32, _color); buffer_write(_buffer, buffer_u32, 0xFFFFFFFF); buffer_write(_buffer, buffer_f32, 0); buffer_write(_buffer, buffer_f32, 0);
                    buffer_write(_buffer, buffer_f32, _l); buffer_write(_buffer, buffer_f32, _b); buffer_write(_buffer, buffer_f32, 0); buffer_write(_buffer, buffer_u32, _color); buffer_write(_buffer, buffer_u32, 0xFFFFFFFF); buffer_write(_buffer, buffer_f32, 0); buffer_write(_buffer, buffer_f32, 0);
                    buffer_write(_buffer, buffer_f32, _r); buffer_write(_buffer, buffer_f32, _b); buffer_write(_buffer, buffer_f32, 0); buffer_write(_buffer, buffer_u32, _color); buffer_write(_buffer, buffer_u32, 0xFFFFFFFF); buffer_write(_buffer, buffer_f32, 0); buffer_write(_buffer, buffer_f32, 0);
                }
                else
                {
                    buffer_seek(_buffer, buffer_seek_start, _pos + 12);
                    
                    buffer_write(_buffer, buffer_u32, _color); buffer_seek(_buffer, buffer_seek_relative, 24);
                    buffer_write(_buffer, buffer_u32, _color); buffer_seek(_buffer, buffer_seek_relative, 24);
                    buffer_write(_buffer, buffer_u32, _color); buffer_seek(_buffer, buffer_seek_relative, 24);
                    
                    buffer_write(_buffer, buffer_u32, _color); buffer_seek(_buffer, buffer_seek_relative, 24);
                    buffer_write(_buffer, buffer_u32, _color); buffer_seek(_buffer, buffer_seek_relative, 24);
                    buffer_write(_buffer, buffer_u32, _color);
                }
                
                ++_x;
            }
            
            ++_y;
        }
    }
}
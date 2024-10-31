// Feather disable all

/// @param depth
/// @param left
/// @param top
/// @param right
/// @param bottom

function __LatClassLayer(_depth, _left, _top, _right, _bottom) constructor
{
    static _system     = __LatSystem();
    static _layerArray = __LatSystem().__layerArray;
    
    static _vertexFormat = (function()
    {
        vertex_format_begin();
        vertex_format_add_position_3d();
        vertex_format_add_color();
        vertex_format_add_color();
        vertex_format_add_texcoord();
        return vertex_format_end();
    })();
    
    static _vertexStride = vertex_format_get_info(_vertexFormat).stride;
    static _symbolStride = 6*_vertexStride;
    
    array_push(_layerArray, self);
    
    visible = true;
    
    __depth  = _depth;
    __left   = _left;
    __top    = _top;
    __right  = _right;
    __bottom = _bottom;
    
    __width  = 1 + __right - __left;
    __height = 1 + __bottom - __top;
    
    __gmLayer = layer_create(__depth);
    
    __emptyPosArray = [];
    __vbPosGrid = ds_grid_create(__width, __height);
    ds_grid_clear(__vbPosGrid, undefined);
    
    __buffer = buffer_create(0, buffer_grow, 1);
    __bufferSize = _symbolStride;
    
    __vertexBuffer = vertex_create_buffer_from_buffer(__buffer, _vertexFormat);
    __vertexBufferDirty = false;
    
    
    
    layer_script_begin(__gmLayer, function()
    {
        if ((event_type == ev_draw) && (event_number = ev_draw_normal))
        {
            if (not visible) return;
            
            if (__vertexBufferDirty)
            {
                __vertexBufferDirty = false;
                vertex_update_buffer_from_buffer(__vertexBuffer, 0, __buffer);
            }
            
            shader_set(__LatShader);
            vertex_submit(__vertexBuffer, pr_trianglelist, sprite_get_texture(sTest, 0));
            shader_reset();
        }
    });
    
    Destroy = function()
    {
        Exists = function() { return false; }
        Destroy = function() {}
        
        layer_destroy(__gmLayer);
        
        ds_grid_destroy(__vbIndexGrid);
        vertex_delete_buffer(__vertexBuffer);
        buffer_delete(__buffer);
    }
    
    Exists = function()
    {
        return true;
    }
    
    __ReserveSymbol = function(_x, _y)
    {
        __vertexBufferDirty = true;
        
        var _pos = __vbPosGrid[# _x, _y];
        if (_pos != undefined)
        {
            return _pos;
        }
        
        _pos = array_pop(__emptyPosArray);
        if (_pos == undefined)
        {
            _pos = __bufferSize;
            __bufferSize += _symbolStride;
        }
        
        __vbPosGrid[# _x, _y] = _pos;
        
        return _pos;
    }
    
    __DeleteSymbol = function(_x, _y)
    {
        __vertexBufferDirty = true;
        
        array_push(__emptyPosArray, _pos);
        buffer_fill(__buffer, _pos, buffer_u32, 0, _symbolStride);
        __vbPosGrid[# _x, _y] = undefined;
    }
}
// Feather disable all

/// Copies the position and size of one instance to another instance. If the `source` instance
/// doesn't exist then the `fallbackWidth` and `fallbackHeight` are used instead.
/// 
/// @param source
/// @param destination
/// @param [fallbackWidth=100]
/// @param [fallbackHeight=100]

function GuiCopyLTRB(_source, _destination, _width = 100, _height = 100)
{
    if (not instance_exists(_destination)) return;
    
    if (instance_exists(_source))
    {
        with(_source)
        {
            _x      = x;
            _y      = y;
            _width  = width;
            _height = height;
        }
    }
    else
    {
        var _x = _destination.x;
        var _y = _destination.y;
    }
    
    GuiSetXYWH(_x, _y, _width, _height, _destination);
}
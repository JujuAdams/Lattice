// Feather disable all

/// @param x
/// @param y
/// @param text
/// @param maxWidth

function LatDrawTextFormatted(_x, _y, _text, _maxWidth)
{
    var _oldFont = draw_get_font();
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    
    var _formattedData = __LatTextFormat(_text, _maxWidth);
    var _commandArray = _formattedData.__commandArray;
    
    var _i = 0;
    repeat(array_length(_commandArray))
    {
        var _command = _commandArray[_i];
        var _commandType = _command.__type;
        
        if (_commandType == __LATTICE_COMMAND_TEXT)
        {
            LatDrawText(_x + _command.__x, _y + _command.__y,
                        _command.__string, _command.__fgColor, _command.__bgColor);
        }
        else if (_commandType == __LATTICE_COMMAND_SPRITE)
        {
            LatDrawSprite(_command.__sprite, _command.__image,
                          _x + _command.__x, _y + _command.__y,
                          _command.__fgColor, _command.__bgColor);
        }
        else if (_commandType == __LATTICE_COMMAND_FONT)
        {
            draw_set_font(_command.__font);
        }
        
        ++_i;
    }
    
    draw_set_font(_oldFont);
}
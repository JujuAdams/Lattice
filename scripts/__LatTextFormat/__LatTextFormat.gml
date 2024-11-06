// Feather disable all

/// @param text
/// @param widthLimit

function __LatTextFormat(_text, _widthLimit)
{
    static _system = __LatSystem();
    static _formatCacheDict = _system.__formatCacheDict;
    
    _text = string(_text);
    
    var _formattedData = _formatCacheDict[$ string_concat(_text, "::", _widthLimit)];
    if (_formattedData == undefined)
    {
        var _oldFont = draw_get_font();
        draw_set_font(_system.__font);
        
        var _commandArray = [];
        
        var _fgColor = c_white;
        var _bgColor = c_black;
        
        var _maxWidth = 0;
        
        _formattedData = {
            __width:  0,
            __height: 0,
            __commandArray: _commandArray,
        };
        
        _formatCacheDict[$ _text] = _formattedData;
        
        var _lineArray = string_split(_text, "\n");
        var _lineCount = array_length(_lineArray);
        
        var _y = 0;
        var _lineIndex = 0;
        repeat(_lineCount)
        {
            var _lineString = _lineArray[_lineIndex];
            var _substringArray = string_split(_lineString, "[");
            
            var _x = 0;
            
            //Handle the first text fragment
            var _textString = _substringArray[0];
            if (_textString != "")
            {
                var _wordArray = string_split(_textString, " ");
                var _wordCount = array_length(_wordArray);
                var _i = 0;
                repeat(_wordCount)
                {
                    var _word = _wordArray[_i];
                    if (_word != "")
                    {
                        var _width = ceil(string_width(_word) / LATTICE_CELL_WIDTH);
                        
                        if ((_x != 0) && (_x + _width > _widthLimit))
                        {
                            _x = 0;
                            ++_y;
                        }
                        
                        array_push(_commandArray, {
                            __type:    __LATTICE_COMMAND_TEXT,
                            __fgColor: _fgColor,
                            __bgColor: _bgColor,
                            __string:  _word,
                            __x:       _x,
                            __y:       _y,
                        });
                        
                        _x += _width;
                    }
                    
                    ++_i;
                    if (_i < _wordCount) _x++;
                }
            }
            else
            {
                _x = 0;
            }
            
            //Then iterate other command tag + text fragment combos, splitting as necessary
            var _ignoreNext = false;
            var _substringIndex = 1;
            repeat(array_length(_substringArray)-1)
            {
                if (_ignoreNext)
                {
                    var _substring = "[" + _substringArray[_substringIndex];
                    var _width = ceil(string_width(_substring) / LATTICE_CELL_WIDTH);
                    
                    array_push(_commandArray, {
                        __type:    __LATTICE_COMMAND_TEXT,
                        __fgColor: _fgColor,
                        __bgColor: _bgColor,
                        __string:  _substring,
                        __x:       _x,
                        __y:       _y,
                    });
                    
                    _x += _width;
                    _ignoreNext = false;
                }
                else
                {
                    var _tagSplitArray = string_split(_substringArray[_substringIndex], "]", false, 1);
                    if (array_length(_tagSplitArray) <= 1)
                    {
                        if (_tagSplitArray[0] == "")
                        {
                            _ignoreNext = true;
                        }
                    }
                    else if (array_length(_tagSplitArray) == 2)
                    {
                        //Handle the contents of the tag
                        var _tagString = _tagSplitArray[0];
                        
                        var _splitArray = string_split(_tagString, ",");
                        if (array_length(_splitArray) > 0)
                        {
                            var _first = _splitArray[0];
                            if (_first == "/c")
                            {
                                _fgColor = c_white;
                                _bgColor = c_black;
                            }
                            else if (_first == "fg")
                            {
                                if (array_length(_splitArray) == 2)
                                {
                                    var _hexCode = _splitArray[1];
                                    if (string_char_at(_hexCode, 1) == "#")
                                    {
                                        _fgColor = int64("0x" + string_delete(_hexCode, 1, 1));
                                        _fgColor = ((_fgColor & 0xFF0000) >> 16) | (_fgColor & 0x00FF00) | ((_fgColor & 0x0000FF) << 16);
                                    }
                                }
                                else
                                {
                                    _fgColor = make_color_rgb(real(_splitArray[1]), real(_splitArray[2]), real(_splitArray[3]));
                                }
                            }
                            else if (_first == "bg")
                            {
                                if (array_length(_splitArray) == 2)
                                {
                                    var _hexCode = _splitArray[1];
                                    if (string_char_at(_hexCode, 1) == "#")
                                    {
                                        _bgColor = int64("0x" + string_delete(_hexCode, 1, 1));
                                        _bgColor = ((_bgColor & 0xFF0000) >> 16) | (_bgColor & 0x00FF00) | ((_bgColor & 0x0000FF) << 16);
                                    }
                                }
                                else
                                {
                                    _bgColor = make_color_rgb(real(_splitArray[1]), real(_splitArray[2]), real(_splitArray[3]));
                                }
                            }
                            else
                            {
                                //Then we try to find a sprite using the command tag
                                var _sprite = asset_get_index(_splitArray[0]);
                                if (sprite_exists(_sprite))
                                {
                                    var _spriteImage = (array_length(_splitArray) >= 2)? real(_splitArray[1]) : 0;
                                    
                                    var _width = ceil(sprite_get_width(_sprite) / LATTICE_CELL_WIDTH);
                                    
                                    array_push(_commandArray, {
                                        __type:    __LATTICE_COMMAND_SPRITE,
                                        __fgColor: _fgColor,
                                        __bgColor: _bgColor,
                                        __sprite:  _sprite,
                                        __image:   _spriteImage,
                                        __x:       _x,
                                        __y:       _y,
                                    });
                                    
                                    _x += _width;
                                }
                                else
                                {
                                    __LatTrace("Command tag \"", _tagString, "\" not recognised");
                                }
                            }
                        }
                    }
                    
                    //Then we handle the next text fragment
                    var _textString = _tagSplitArray[1];
                    if (_textString != "")
                    {
                        var _wordArray = string_split(_tagSplitArray[1], " ");
                        var _wordCount = array_length(_wordArray);
                        var _i = 0;
                        repeat(_wordCount)
                        {
                            var _word = _wordArray[_i];
                            if (_word != "")
                            {
                                var _width = ceil(string_width(_word) / LATTICE_CELL_WIDTH);
                                
                                if ((_x != 0) && (_x + _width > _widthLimit))
                                {
                                    _x = 0;
                                    ++_y;
                                }
                                
                                array_push(_commandArray, {
                                    __type:    __LATTICE_COMMAND_TEXT,
                                    __fgColor: _fgColor,
                                    __bgColor: _bgColor,
                                    __string:  _word,
                                    __x:       _x,
                                    __y:       _y,
                                });
                                
                                _x += _width;
                            }
                            
                            ++_i;
                            if (_i < _wordCount) _x++;
                        }
                    }
                }
                
                ++_substringIndex;
            }
            
            _maxWidth = max(_maxWidth, _x);
            
            ++_lineIndex;
            ++_y;
        }
        
        _formattedData.__width  = _maxWidth;
        _formattedData.__height = _y;
        
        draw_set_font(_oldFont);
    }
    
    return _formattedData;
}
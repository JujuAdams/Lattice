// Feather disable all

/// Creates a grid layout with member instances arranged in rows when `GuiLayoutFinish()` is
/// called.
/// 
/// @param parent
/// @param spacing
/// @param cellWidth
/// @param cellHeight
/// @param countPerRow

function GuiLayoutStartGridH(_parent, _spacing, _cellWidth, _cellHeight, _countPerRow)
{
    var _layout = new __GuiClassLayoutGridH(_parent, _spacing, _cellWidth, _cellHeight, _countPerRow);
    return _layout;
}



/// @param parent
/// @param spacing
/// @param hAlign
/// @param vAlign

function __GuiClassLayoutGridH(_parent, _spacing, _cellWidth, _cellHeight, _countPerRow) constructor
{
    __parent      = _parent;
    __spacing     = _spacing;
    __cellWidth   = _cellWidth;
    __cellHeight  = _cellHeight;
    __countPerRow = _countPerRow;
    
    __width  = 0;
    __height = 0;
    
    __maxWidth  = 0;
    __maxHeight = 0;
    
    __instanceArray = [];
    
    
    
    __Add = function(_instance)
    {
        var _count = array_length(__instanceArray);
        var _cellX = _count mod __countPerRow;
        var _cellY = _count div __countPerRow;
        
        array_push(__instanceArray, _instance);
        
        __maxWidth  = max(__maxWidth,  _instance.width);
        __maxHeight = max(__maxHeight, _instance.height);
        
        if (_cellY == 0)
        {
            if (_cellX == 0)
            {
                __width  = __cellWidth;
                __height = __cellHeight;
            }
            else
            {
                __width  = __cellWidth*_cellX + __spacing*(_cellX - 1);
            }
        }
        else
        {
            __height = __cellHeight*_cellY + __spacing*(_cellY - 1);
        }
    }
    
    __RecalculateBounds = function()
    {
        __GuiLayoutRecalculateBounds();
    }
    
    __Finish = function(_x, _y)
    {
        if (__parent.__scrollEnabled)
        {
            _x += __parent.__scrollX - __parent.__scrollMaxX;
            _y += __parent.__scrollY - __parent.__scrollMaxY;
        }
        
        var _instanceArray = __instanceArray;
        var _spacing       = __spacing;
        var _cellWidth     = __cellWidth;
        var _cellHeight    = __cellHeight;
        var _countPerRow   = __countPerRow;
        
        var _memberX = _x + _cellWidth div 2;
        var _memberY = _y + _cellHeight div 2;
        
        var _cellX = 0;
        var _i = 0;
        repeat(array_length(_instanceArray))
        {
            GuiSetPosition(_memberX, _memberY, _instanceArray[_i]);
            
            ++_cellX;
            if (_cellX >= _countPerRow)
            {
                _cellX = 0;
                
                _memberX  = _x + _cellWidth div 2;
                _memberY += _spacing + _cellHeight;
            }
            else
            {
                _memberX += _spacing + _cellWidth;
            }
            
            ++_i;
        }
    }
    
    __FinishWithScroll = function(_padLeft, _padTop, _padRight, _padBottom)
    {
        if (not __parent.__scissorState)
        {
            __GuiError("Scissor region not set up");
        }
        
        __Finish(__parent.__scissorLeft, __parent.__scissorTop);
        GuiScrollSetupHori(_padLeft, _padRight, __parent);
    }
}
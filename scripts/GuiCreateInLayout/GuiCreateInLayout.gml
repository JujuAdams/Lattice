// Feather disable all

/// Creates an instance in a layout.
/// 
/// @param layout
/// @param object
/// @param [variableStruct]

function GuiCreateInLayout(_layout, _object, _struct = undefined)
{
    var _instance = GuiCreate(_object, _struct, _layout.__parent);
    _layout.__Add(_instance);
    
    return _instance;
}
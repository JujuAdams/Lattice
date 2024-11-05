// Feather disable all

/// @param group
/// @param [default=0]

global.radioButtonGroup = {};

function RadioButtonGet(_group, _default = 0)
{
    return global.radioButtonGroup[$ _group] ?? _default;
}
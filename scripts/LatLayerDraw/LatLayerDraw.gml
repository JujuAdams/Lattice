// Feather disable all

/// @param layer
/// @param [x=0]
/// @param [y=0]

function LatLayerDraw(_layer, _x = 0, _y = 0)
{
    if (_layer == undefined) return;
    _layer.Draw(_x, _y);
}
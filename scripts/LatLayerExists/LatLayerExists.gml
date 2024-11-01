// Feather disable all

/// @param layer

function LatLayerExists(_layer)
{
    return (_layer == undefined)? false : _layer.Exists();
}
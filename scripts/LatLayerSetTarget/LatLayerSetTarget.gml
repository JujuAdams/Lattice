// Feather disable all

/// @param layer

function LatLayerSetTarget(_layer)
{
    static _system = __LatSystem();
    
    _system.__layerTarget = _layer;
}
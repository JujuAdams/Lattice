// Feather disable all

__LatSystem();
function __LatSystem()
{
    static _system = undefined;
    if (_system != undefined) return _system;
    
    _system = {};
    with(_system)
    {
        __LatTrace($"Welcome to Lattice by Juju Adams! This is version {LATTICE_VERSION}, {LATTICE_DATE}");
        
        __layerArray  = [];
        __layerTarget = undefined;
        
        __boxDict = {};
    }
    
    return _system;
}
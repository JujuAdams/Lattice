// Feather disable all

#macro __LATTICE_COMMAND_TEXT      0
#macro __LATTICE_COMMAND_SPRITE    1
#macro __LATTICE_COMMAND_FONT      2
#macro __LATTICE_COMMAND_FG_COLOR  3
#macro __LATTICE_COMMAND_BG_COLOR  4

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
        
        __font = -1;
        
        __formatCacheDict = {};
    }
    
    return _system;
}
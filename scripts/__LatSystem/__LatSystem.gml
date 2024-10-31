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
        
        if (LATTICE_TOTAL_SYMBOLS >= (1 << 16)-1)
        {
            __LatError("Symbol texture too big. Total number of symbols exceeds 65355\nPlease reduce LATTICE_SYMBOL_TEXTURE_WIDTH and/or LATTICE_SYMBOL_TEXTURE_HEIGHT");
        }
        
        __layerArray  = [];
        __layerTarget = undefined;
        
        __spriteMap = ds_map_create();
        __fontMap   = ds_map_create();
        
        __fontSprite       = undefined;
        __fontCharacterMap = undefined;
        
        __symbolsFreeArray = array_create(LATTICE_TOTAL_SYMBOLS, true);
        __symbolsPrevFree  = 0;
        
        __symbolsUsed    = 0;
        __symbolsDirty   = false;
        __symbolsSurface = undefined;
        __symbolsSprite  = undefined;
        __symbolsTexture = -1;
        
        __paletteArray = array_create(256, c_white);
        __paletteSurface = surface_create(256, 1);
        surface_set_target(__paletteSurface);
        draw_clear(c_white);
        draw_point_color(0, 0, c_black);
        surface_reset_target();
    }
    
    return _system;
}
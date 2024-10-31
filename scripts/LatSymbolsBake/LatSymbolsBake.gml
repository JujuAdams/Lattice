// Feather disable all

function LatSymbolsBake()
{
    static _system = __LatSystem();
    
    with(_system)
    {
        if (__symbolsSprite != undefined)
        {
            sprite_delete(__symbolsSprite);
        }
        
        __symbolsSprite  = sprite_create_from_surface(__symbolsSurface, 0, 0, LATTICE_SYMBOL_TEXTURE_WIDTH, LATTICE_SYMBOL_TEXTURE_HEIGHT, false, false, 0, 0);
        __symbolsTexture = sprite_get_texture(__symbolsSprite, 0);
    }
}
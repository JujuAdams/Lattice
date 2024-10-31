// Feather disable all

function __LatEditSymbolSurface()
{
    static _system = __LatSystem();
    
    __LatEnsureSymbolSurface();
    
    with(_system)
    {
        __symbolsDirty   = true;
        __symbolsTexture = surface_get_texture(__symbolsSurface);
    }
}
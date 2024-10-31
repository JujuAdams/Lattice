// Feather disable all

function __LatEnsureSymbolSurface()
{
    static _system = __LatSystem();
    
    var _surface = _system.__symbolsSurface;
    if ((_surface == undefined) || (not surface_exists(_surface)))
    {
        with(_system)
        {
            __symbolsSurface = surface_create(LATTICE_SYMBOL_TEXTURE_WIDTH, LATTICE_SYMBOL_TEXTURE_HEIGHT);
            
            surface_set_target(__symbolsSurface);
            
            if ((__symbolsSprite != undefined) && sprite_exists(__symbolsSprite))
            {
                gpu_set_blendmode_ext(bm_one, bm_zero);
                draw_sprite(__symbolsSprite, 0, 0, 0);
                gpu_set_blendmode(bm_normal);
            }
            else
            {
                draw_clear_alpha(c_black, 0);
                __LatDrawRectangle(0, 0, LATTICE_CELL_WIDTH-1, LATTICE_CELL_HEIGHT-1);
            }
            
            surface_reset_target();
        }
    }
}
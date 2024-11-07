// Feather disable all

/// @param x
/// @param y

function LatSymbolsDebugDraw(_x, _y)
{
    draw_primitive_begin_texture(pr_trianglestrip, surface_get_texture(__LatEnsureSymbolSurface()));
    draw_vertex_texture(_x, _y, 0, 0);
    draw_vertex_texture(_x + LATTICE_SYMBOL_TEXTURE_WIDTH, _y, 1, 0);
    draw_vertex_texture(_x, _y + LATTICE_SYMBOL_TEXTURE_HEIGHT, 0, 1);
    draw_vertex_texture(_x + LATTICE_SYMBOL_TEXTURE_WIDTH, _y + LATTICE_SYMBOL_TEXTURE_HEIGHT, 1, 1);
    draw_primitive_end();
}
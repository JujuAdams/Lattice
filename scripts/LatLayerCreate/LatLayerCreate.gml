// Feather disable all

/// @param depth
/// @param [left]
/// @param [top]
/// @param [right]
/// @param [bottom]

function LatLayerCreate(_depth, _left = 0, _top = 0, _right = LATTICE_COLUMNS-1, _bottom = LATTICE_ROWS-1)
{
    return new __LatClassLayer(_depth, _left, _top, _right, _bottom);
}
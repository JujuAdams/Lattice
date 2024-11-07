// Feather disable all

/// @param tag

function LatSymbolAddTag(_tag)
{
    var _assetArray = tag_get_asset_ids(_tag, asset_sprite);
    var _i = 0;
    repeat(array_length(_assetArray))
    {
        LatSymbolAddSprite(_assetArray[_i]);
        ++_i;
    }
}
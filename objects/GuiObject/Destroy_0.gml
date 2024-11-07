// Feather disable all

__GuiRemoveParent(id);
GuiDestroyChildren(id);

if (instance_exists(__selectOnDestroy))
{
    GuiNavSelectSoft(__selectOnDestroy);
}

GuiNavSetFocus(false);

with(__GuiSystem())
{
    __stepDirty = true;
    __drawDirty = true;
    
    var _instance = __nameMap[? other.__name];
    if (_instance == other.id) ds_map_delete(__nameMap, other.__name);
    
    if (__popUpRoot == other.id) __popUpRoot = noone;
}
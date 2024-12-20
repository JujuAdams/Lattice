// Feather disable all

var _system = __GuiSystem();

__GuiSetIfNotDefined(id, "width",  0);
__GuiSetIfNotDefined(id, "height", 0);

__GuiSetIfNotDefined(id, "navLeft",  noone);
__GuiSetIfNotDefined(id, "navRight", noone);
__GuiSetIfNotDefined(id, "navUp",    noone);
__GuiSetIfNotDefined(id, "navDown",  noone);

__GuiSetIfNotDefined(id, "scrollMarginLeft",   6);
__GuiSetIfNotDefined(id, "scrollMarginRight",  6);
__GuiSetIfNotDefined(id, "scrollMarginTop",    6);
__GuiSetIfNotDefined(id, "scrollMarginBottom", 6);

/////////////////////////
//                     //
//  Private Variables  //
//                     //
/////////////////////////

__xInternal = x;
__yInternal = y;

__overState = GUI_OFF;
__holdState = GUI_OFF;
__click     = false;

__parent = noone;
__GuiSetParent(id, _system.__tempParent);
__GuiSetIfNotDefined(id, "priority", 0);

__behavior = GUI_BEHAVIOR_COSMETIC;
__drawEnd  = false;

persistent = true;

__name = undefined;

__disable = false;

__focusable       = false;
__focused         = false;
__focusBlockHover = false;

__raycastDisableHori = false;
__raycastDisableVert = false;

__childArray = [];

__orderDirty = false;
__updating   = false;

__scrollEnabled   = false;
__selectOnDestroy = noone;

__scissorState = false;
//Further scissor variables set in `GuiScrollSetRegionExt()`

__guiIndex = __GuiSystem().__guiIndex;
__GuiSystem().__guiIndex++;
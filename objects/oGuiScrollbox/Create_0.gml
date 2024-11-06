// Feather disable all

scrollbox = GuiCreate(GuiExampleFrame, {
    x:       2,
    y:       2,
    width:  22,
    height: 12,
},
GUI_ROOT);

var _layout = GuiLayoutStartListV(scrollbox, 0, fa_left, fa_top);

var _i = 0;
repeat(20)
{
    GuiCreateInLayout(_layout, GuiExampleSmallButton, {
        text: $"Example {_i}",
    });
    
    ++_i;
}

GuiScrollSetRegion(1, scrollbox);
GuiLayoutFinishWithScroll(_layout);
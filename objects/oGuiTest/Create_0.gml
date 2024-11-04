// Feather disable all

lastMouseX = device_mouse_x_to_gui(0);
lastMouseY = device_mouse_y_to_gui(0);

font = font_add_sprite_ext(sFontASCII, " !\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~", false, 0);
LatTextSetFont(font);

LatBoxDefinePattern("test", sFontFull, 0, 201, 205, 187, 186, 188, 205, 200, 186);

GuiNavSetMode(GUI_NAV_MOUSE);

var _layout = GuiLayoutStartListV(GUI_ROOT, 0, fa_left, fa_top);

GuiCreateInLayout(_layout, GuiExampleButton, {
    text: "Test Button 1",
});

GuiCreateInLayout(_layout, GuiExampleButton, {
    text: "Test Button 2",
    func: function()
    {
        var _modal = GuiCreate(GuiExampleFrame, undefined, GUI_ROOT, 40, 15);
        GuiSetBehavior(GUI_BEHAVIOR_MODAL, _modal);
        GuiNavSelectOnDestroy(_modal, id);
        
        var _layout = GuiLayoutStartListV(_modal, 0, fa_center, fa_middle);
        
        GuiCreateInLayout(_layout, GuiExampleText, {
            text: "Here is a test of a modal.",
        });
        
        GuiCreateInLayout(_layout, GuiExampleSpacer, {
            width: 1,
            height: 1,
        });
        
        GuiCreateInLayout(_layout, GuiExampleButton, {
            text: "Cancel",
            func: function()
            {
                GuiDestroy(GuiGetParent());
            },
        });
        
        GuiCreateInLayout(_layout, GuiExampleButton, {
            text: "Accept",
            func: function()
            {
                GuiDestroy(GuiGetParent());
            },
        });
        
        GuiLayoutFinish(_layout, _modal.x, _modal.y);
        GuiLayoutNavSelectFirst(_layout);
        GuiSetSizeAroundChildrenExt(4, 2, 4, 2, _modal);
    },
});

repeat(8)
{
    GuiCreateInLayout(_layout, GuiExampleButton, {
        text: "Another Button",
    });
}

GuiLayoutFinish(_layout, 0, 0);
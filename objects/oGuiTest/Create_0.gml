// Feather disable all

lastMouseX = device_mouse_x_to_gui(0);
lastMouseY = device_mouse_y_to_gui(0);

font = font_add_sprite_ext(sFontASCII, " !\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~", false, 0);
LatTextSetFont(font);

LatBoxDefinePattern("test", sFontFull, 0, 201, 205, 187, 186, 188, 205, 200, 186);

GuiNavSetMode(GUI_NAV_MOUSE);

var _layout = GuiLayoutStartListV(GUI_ROOT, 0, fa_left, fa_top);

GuiCreateInLayout(_layout, GuiExampleSmallButton, {
    text: "Small Button!",
});

GuiCreateInLayout(_layout, GuiExampleBigButton, {
    text: "Big Button!",
});

GuiCreateInLayout(_layout, GuiExampleTextFormatted, {
    text: "'twas [fg,#ffc0c0]brillig[/c] and the [fg,#c0ffc0]slithey toves[/c] didst gyre and gimble in the wabe",
    maxWidth: 20,
});

GuiCreateInLayout(_layout, GuiExampleSmallButton, {
    text: "Small button\nwith text\nover many\nlines",
});

GuiCreateInLayout(_layout, GuiExampleBigButton, {
    text: "Big button\nwith newlines",
});

GuiCreateInLayout(_layout, GuiExampleSmallButton, {
    text: "Open Modal",
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
        
        GuiCreateInLayout(_layout, GuiExampleBigButton, {
            text: "Cancel",
            func: function()
            {
                GuiDestroy(GuiGetParent());
            },
        });
        
        GuiCreateInLayout(_layout, GuiExampleBigButton, {
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

var _i = 0;
repeat(4)
{
    GuiCreateInLayout(_layout, GuiExampleRadioButton, {
        group: "test",
        index: _i,
        text: $"Radio Button {_i}",
        func: function(_old, _new)
        {
            show_debug_message($"Radio button option changed from {_old} to {_new}");
        }
    });
    
    ++_i;
}

GuiCreateInLayout(_layout, GuiExampleSliderH, {
    width: 12,
    height: 1,
});

GuiCreateInLayout(_layout, GuiExampleScrollBarH, {
    width: 22,
    height: 1,
});

GuiCreateInLayout(_layout, GuiExampleCheckbox, {
    text: "Checkbox test",
});

GuiLayoutFinish(_layout, 0, 0);

GuiCreate(GuiExampleFillBarH, {
    x: 25,
    y:  0,
    width:  10,
    height:  1,
}, GUI_ROOT);

GuiCreate(GuiExampleFillBarV, {
    x: 36,
    y:  0,
    width:   1,
    height: 10,
}, GUI_ROOT);

GuiCreate(GuiExampleSliderV, {
    x: 40,
    y:  0,
    width:   2,
    height: 10,
}, GUI_ROOT);

GuiCreate(GuiExampleScrollBarV, {
    x: 45,
    y:  0,
    width:   1,
    height: 10,
}, GUI_ROOT);
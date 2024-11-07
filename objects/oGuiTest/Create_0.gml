// Feather disable all

var _yellow    = #FFFF66;
var _gold      = #FFCF0F;
var _lightBlue = #66CCFF;
var _midBlue   = #336699;
var _darkBlue  = #264C72;
var _grey      = #80C4DE;

background = GuiCreate(GuiExampleRect, {
    x: 0,
    y: 0,
    width:  80,
    height: 30,
    color:  C_MONSTER,
}, GUI_ROOT);

with(background)
{
    GuiCreate(GuiExampleText, {
        x: 1,
        y: 1,
        text: "BUTTONS",
        fgColor: C_SUPERSTAR,
    });
    
    GuiCreate(GuiExampleSmallButton, {
        x: 1,
        y: 3,
        text: "Click",
    });
    
    GuiCreate(GuiExampleBigButton, {
        x: 1,
        y: 5,
        text: "Click",
    });
    
    GuiCreate(GuiExampleText, {
        x: 16,
        y: 1,
        text: "BARS",
        fgColor: C_SUPERSTAR,
    });
    
    GuiCreate(GuiExampleFillBarH, {
        x: 16,
        y: 3,
        width: 12,
    });
    
    GuiCreate(GuiExampleSliderH, {
        x: 16,
        y: 5,
        width: 12,
    });
    
    GuiCreate(GuiExampleScrollBarH, {
        x: 16,
        y: 7,
        width: 12,
    });
    
    GuiCreate(GuiExampleFillBarV, {
        x: 16,
        y: 9,
        height: 7,
    });
    
    GuiCreate(GuiExampleSliderV, {
        x: 18,
        y: 9,
        height: 7,
    });
    
    GuiCreate(GuiExampleScrollBarV, {
        x: 20,
        y: 9,
        height: 7,
    });
    
    GuiCreate(GuiExampleText, {
        x: 32,
        y: 1,
        text: "SCROLLBOX",
        fgColor: C_SUPERSTAR,
    });
    
    scrollbox = GuiCreate(GuiExampleScrollbox, {
        x: 32,
        y: 3,
        width: 20,
        height: 8,
    });
    
    var _layout = GuiLayoutStartListV(scrollbox, 0, fa_left, fa_top);
    
    var _i = 1;
    repeat(9)
    {
        GuiCreateInLayout(_layout, GuiExampleSmallButton, {
            text: $"item {_i}",
        });
    
        ++_i;
    }
    
    GuiLayoutFinishWithScroll(_layout);
    
    GuiCreate(GuiExampleText, {
        x: 32,
        y: 12,
        text: "RADIO BUTTON",
        fgColor: C_SUPERSTAR,
    });
    
    GuiCreate(GuiExampleRadioButton, {
        text:  "Group 1 Option 1",
        group: "Group 1",
        index: 1,
        x: 32,
        y: 14,
    });
    
    GuiCreate(GuiExampleRadioButton, {
        text:  "Group 1 Option 2",
        group: "Group 1",
        index: 2,
        x: 32,
        y: 15,
    });
    
    GuiCreate(GuiExampleText, {
        x: 56,
        y: 1,
        text: "CHECKBOX",
        fgColor: C_SUPERSTAR,
    });
    
    GuiCreate(GuiExampleCheckbox, {
        x: 56,
        y: 3,
        text: "Check box 1",
    });
    
    GuiCreate(GuiExampleCheckbox, {
        x: 56,
        y: 4,
        text: "Check box 2",
    });
}

 

return;

scrollbox = GuiCreate(GuiExampleScrollbox, {
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

GuiLayoutFinishWithScroll(_layout);
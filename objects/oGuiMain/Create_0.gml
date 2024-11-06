// Feather disable all

lastMouseX = device_mouse_x_to_gui(0);
lastMouseY = device_mouse_y_to_gui(0);

font = font_add_sprite_ext(sFontASCII, " !\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~", false, 0);
LatTextSetFont(font);

LatBoxDefinePattern("test", sFontFull, 0, 201, 205, 187, 186, 188, 205, 200, 186);

instance_create_depth(0, 0, 0, oGuiTest);
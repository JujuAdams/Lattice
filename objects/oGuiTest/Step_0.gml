// Feather disable all

var _dX = keyboard_check(vk_right) - keyboard_check(vk_left);
var _dY = keyboard_check(vk_down) - keyboard_check(vk_up);

//Swap between gamepad and mouse
if ((_dX != 0) || (_dY != 0))
{
    GuiNavSetMode(GUI_NAV_DIRECTIONAL);
}
else if (device_mouse_check_button(0, mb_left) || (point_distance(lastMouseX, lastMouseY, device_mouse_x_to_gui(0), device_mouse_y_to_gui(0)) > 10))
{
    lastMouseX = device_mouse_x_to_gui(0);
    lastMouseY = device_mouse_y_to_gui(0);
    
    GuiNavSetMode(GUI_NAV_MOUSE);
}

GuiInputPointer(device_mouse_x(0) div LATTICE_CELL_WIDTH,
                device_mouse_y(0) div LATTICE_CELL_HEIGHT,
                device_mouse_check_button(0, mb_left));

GuiInputDirectional(_dX, _dY, keyboard_check(vk_space));

GuiStep();
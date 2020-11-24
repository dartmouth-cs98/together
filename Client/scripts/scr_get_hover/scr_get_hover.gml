///@description Check if the mouse is hovering over a button
function scr_get_hover(){
	var _mouseX = device_mouse_x_to_gui(0);
	var _mouseY = device_mouse_y_to_gui(0);
	
	// Does it take the values of the object from which the script was called?
	return point_in_rectangle(_mouseX, _mouseY, x, y, x + width, y + width);
}
/// @description Insert description here
// You can write your code in this editor

if (mouse_check_button_released(mb_left)){

	if (!finished and open and mouse_x >= 80 and mouse_x <= 450 and mouse_y >= 30 and mouse_y <= 250){
		ds_list_add(x_positions, mouse_x);
		ds_list_add(y_positions, mouse_y);
	}
}
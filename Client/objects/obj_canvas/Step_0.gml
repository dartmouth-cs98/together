/// @description Insert description here
// You can write your code in this editor

if (ds_list_size(x_positions) == 0 and open){
	
	ds_list_add(x_positions, global.cam_X + 25);
	ds_list_add(y_positions, global.cam_Y + 270);
	destination_x = global.cam_X + 490;
	destination_y = global.cam_Y + 25;
}

if (mouse_check_button_released(mb_left)){
			
	adjusted_x = (mouse_x);
	adjusted_y = (mouse_y);

	if (!finished and open and true){ //adjusted_x >= -11 and adjusted_x <= 75 and adjusted_y >= -25 and adjusted_y <= 25){
		ds_list_add(x_positions, adjusted_x);
		ds_list_add(y_positions, adjusted_y);
	}
}
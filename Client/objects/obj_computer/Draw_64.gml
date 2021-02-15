/// @description Insert description here
// You can write your code in this editor

if (open and !finished){
	draw_rectangle_color(80, 30, 450, 250, c_black, c_black, c_black, c_black, false);

	draw_set_color(c_green);
	for (i = 0; i < sign_count; i++){
		
		if (i == 0) draw_text(100, 39+(16*i), "Market: " + ds_list_find_value(max_occupancy_list, i));
		if (i == 1) draw_text(100, 39+(16*i), "Farm: " + ds_list_find_value(max_occupancy_list, i));
		if (i == 2) draw_text(100, 39+(16*i), "Office: " + ds_list_find_value(max_occupancy_list, i));

	}
}
/// @description Insert description here
// You can write your code in this editor

if (open){

	draw_set_color(c_white);
	draw_rectangle(80, 30, 450, 250, false);
	
	player_draw_color = make_color_rgb(obj_player.chat_color_1, obj_player.chat_color_2, 
			obj_player.chat_color_3);
	
	for (i = 0; i < ds_list_size(x_positions); i++){	
		draw_point_color(ds_list_find_value(x_positions,i), ds_list_find_value(y_positions,i), 
				layer_draw_color);
	}
	
	for (i = 1; i < ds_list_size(x_positions); i++){
		
		draw_line_width_color(ds_list_find_value(x_positions, i - 1), 
				ds_list_find_value(y_positions, i - 1), ds_list_find_value(x_positions, i), 
				ds_list_find_value(y_positions, i), 2, player_draw_color, player_draw_color);
	}
}
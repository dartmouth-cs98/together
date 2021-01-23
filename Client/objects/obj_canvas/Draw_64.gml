/// @description Insert description here
// You can write your code in this editor

var destination_x = 400;
var destination_y = 225;
var current_points_size = ds_list_size(x_positions);

if (open){

	draw_set_color(c_white);
	draw_rectangle(80, 30, 450, 250, false);
	
	player_draw_color = make_color_rgb(obj_player.chat_color_1, obj_player.chat_color_2, 
			obj_player.chat_color_3);
	
	draw_point_color(destination_x, destination_y, player_draw_color);
	for (i = 0; i < ds_list_size(x_positions); i++){	
		draw_point_color(ds_list_find_value(x_positions,i), ds_list_find_value(y_positions,i), 
				player_draw_color);
	}
	
	for (i = 1; i < current_points_size; i++){
		
		draw_line_width_color(ds_list_find_value(x_positions, i - 1), 
				ds_list_find_value(y_positions, i - 1), ds_list_find_value(x_positions, i), 
				ds_list_find_value(y_positions, i), 2, player_draw_color, player_draw_color);
	}
	if (current_points_size > 4){
		
		if (abs(ds_list_find_value(x_positions, current_points_size) - destination_x) < 5 
				and abs(ds_list_find_value(y_positions, current_points_size) - destination_y) < 5){
					
			// Graph is complete, update accordingly
			open = false;
			
			// Write message saying task complete
		}
	}
}
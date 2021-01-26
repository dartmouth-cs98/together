/// @description Insert description here
// You can write your code in this editor

var current_points_size = ds_list_size(x_positions);

if (open and !finished){

	draw_set_color(c_white);
	draw_rectangle(80, 30, 450, 250, false);
	
	player_draw_color = make_color_rgb(obj_player.chat_color_1, obj_player.chat_color_2, 
			obj_player.chat_color_3);
	
	draw_set_color(player_draw_color);
	
	draw_circle_color(destination_x, destination_y, 3, player_draw_color, player_draw_color, false);
	//draw_circle_color(start_x, start_y, 3, player_draw_color, player_draw_color, false);

	//draw_point_color(destination_x, destination_y, c_blue);
	for (i = 0; i < current_points_size; i++){	
		draw_circle_color(ds_list_find_value(x_positions,i), ds_list_find_value(y_positions,i), 
				3, player_draw_color, player_draw_color, false);
	}
	
	for (i = 1; i < current_points_size; i++){
		
		draw_line_width_color(ds_list_find_value(x_positions, i - 1), 
				ds_list_find_value(y_positions, i - 1), ds_list_find_value(x_positions, i), 
				ds_list_find_value(y_positions, i), 4, player_draw_color, player_draw_color);
	}
	if (current_points_size > 4){
		
		if (abs(ds_list_find_value(x_positions, current_points_size - 1) - destination_x) < 5 
				and abs(ds_list_find_value(y_positions, current_points_size - 1) - destination_y) < 5){
					
			// Graph is complete, update accordingly
			ds_list_add(x_positions, 400);
			ds_list_add(y_positions, 225);
			global.any_menu = false;
			scr_unpause();
			open = false;
			finished = true;
			scr_task_complete(5);
			
			// Write message saying task complete
			scr_create_text("Graph complete! Go present your findings to the mayor.");
		}
	}
}
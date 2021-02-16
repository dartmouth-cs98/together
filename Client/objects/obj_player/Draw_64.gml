/// @description Draw taskbar

draw_sprite(spr_taskbar_border, 0, taskbar_x, taskbar_y);
draw_sprite_stretched(spr_taskbar, 0, taskbar_x, taskbar_y, (global.taskbar/taskbar_max) * taskbar_width, taskbar_height);
draw_sprite(spr_taskbar_border, 0, food_bar_x, food_bar_y);
draw_sprite_stretched(spr_food_bar, 0, food_bar_x, food_bar_y, food/food_max * food_bar_width, food_bar_height);
draw_sprite(spr_taskbar_border, 0, water_bar_x, water_bar_y);
draw_sprite_stretched(spr_water_bar, 0, water_bar_x, water_bar_y, water/water_max * water_bar_width, water_bar_height);

if (display_tasks){
	draw_set_halign(fa_left);
	draw_set_font(Font2);
	draw_set_color(c_yellow);
	var my_tasks = ds_map_find_value(con_game_manager.role_to_tasks_map, role);
	for (i = 0; i < ds_list_size(my_tasks); i++){
		draw_text(20, i * 15 + 130, ds_list_find_value(my_tasks, i));
	}
}

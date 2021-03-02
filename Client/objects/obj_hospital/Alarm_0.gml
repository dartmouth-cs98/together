/// @description Insert description here
// You can write your code in this editor

alarm[0] = room_speed * 2;
show_debug_message("Alarming!");

if (open){
	if (e){
		global.any_menu = false;
		scr_unpause();
		open = false;
		finished = true;
		var tasks = ds_map_find_value(con_game_manager.role_to_tasks_map, obj_player.role);
		for (i = 0; i < ds_list_size(tasks); i++){
			if (ds_list_find_value(tasks, i) == "Checkup"){
				ds_list_delete(tasks, i);
			}
		}
		scr_task_complete(5);
	}
	if (d) e = true;
	if (c) d = true;
	if (b) c = true;
	if (a) b = true;
	a = true;
	show_debug_message(b);
}
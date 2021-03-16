/// @description Insert description here
// You can write your code in this editor

alarm[0] = room_speed * 2;

if (open){
	
	if (!(finished or obj_player.role == "Doctor")){
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
			task = "Get Vaccine";
		}
		if (d) e = true;
		if (c) d = true;
		if (b) c = true;
		if (a) b = true;
		a = true;
	}
	else if (obj_player.role == "Doctor"){
		doctor_in = true;
	}
	else if (arm_in and doctor_in){
		obj_player.infection_level = 0;
		scr_create_text("You've been cured!");
		arm_in = false;
		buffer_seek(con_client.client_buffer, buffer_seek_start, 0);		// Go to start of buffer
		buffer_write(con_client.client_buffer, buffer_u8, network.vaccinate);
		buffer_write(con_client.client_buffer, buffer_u8, 4);
		network_send_packet(con_client.client, con_client.client_buffer, buffer_tell(con_client.client_buffer));
	}
}
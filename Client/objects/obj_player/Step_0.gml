/// @description Every frame

#region Manage 8-directional movement, based on this video: https://www.youtube.com/watch?v=0-a0Fak7cjk
if (!global.paused) {
	h_input = keyboard_check(vk_right) - keyboard_check(vk_left);
	v_input = keyboard_check(vk_down) - keyboard_check(vk_up);
} else {
	h_input = 0;
	v_input = 0;
}
if (h_collide == -1 && h_input < 0) { h_input = 0; } // Left
else if (h_collide == 1 && h_input > 0) { h_input = 0; } // Right
if (v_collide == -1 && v_input < 0){ v_input = 0; } // Up
else if (v_collide == 1 && v_input > 0){ v_input = 0; } // Down
h_collide = 0;
v_collide = 0;
// Outer boundaries
if (h_input < 0 and x < 25){
	h_input = 0;
}
if (h_input > 0 and x > 2475){
	h_input = 0;
}
if (v_input < 0 and y < 25){
	v_input = 0;
}
if (v_input > 0 and y > 1475){
	v_input = 0;
}
buffer_seek(con_client.client_buffer, buffer_seek_start, 0);		// Go to start of buffer
buffer_write(con_client.client_buffer, buffer_u8, network.move);	// ID
buffer_write(con_client.client_buffer, buffer_s8, h_input);			// Horizontal input
buffer_write(con_client.client_buffer, buffer_s8, v_input);			// Vertical input
buffer_write(con_client.client_buffer, buffer_u8, walk_speed);		// Walk speed
network_send_packet(con_client.client, con_client.client_buffer, buffer_tell(con_client.client_buffer));
//show_debug_message("SEND: move: "+string(current_time));
  
#endregion

#region Manage contagion checks
if (infection_level < 4){
	DTO = 0;
	for (i = 0; i < con_game_manager.other_count; i++){
		var other_player = instance_find(obj_other, i);
		DTO = distance_to_object(other_player)
		infection_level_other = other_player.infection_level;
		if (DTO < 5){
			if (infection_level_other > 0 and infection_level_other < 4){
				if (infection_level == 0) infection_level = 1;
				else if (infection_level < 3) infection_level = 3;
			}
			else if (infection_level < 3 and infection_level_other != 0) infection_level = 3;
		}
	
		else if (DTO < 15){
			if (infection_level_other > 1 and infection_level_other < 4){
				if (infection_level == 0 and irandom(2) == 0) infection_level = 1;
			}
			else if (infection_level < 3 and irandom(1) == 0 and infection_level_other != 0) infection_level = 3;
		}
	
		else if (DTO < 30){
			if (infection_level_other > 2 and infection_level_other < 5){		
				if (infection_level == 0 and irandom(4) == 0) infection_level = 1;	
			}
			else if (infection_level < 3 and irandom(2) == 0 and infection_level_other != 0) infection_level = 3;
		}
	
		else if (DTO < 50){
		
			if (infection_level < 3 and infection_level_other == 6 and irandom(3) == 0) infection_level = 3;
		}
	}
	for (i = 0; i < con_game_manager.npc_count; i++){
		var npc = instance_find(obj_npc, i);
		DTO = distance_to_object(npc);
		var npc_infection_level = con_game_manager.npc_infection_level;
		if (DTO < 5){
			if (npc_infection_level > 2){
				if (infection_level < 3) infection_level = 3;
			}
			else if (irandom(2) == 0 and infection_level < 3) infection_level = 3;
		}
	
		else if (DTO < 15){
			if (npc_infection_level > 2){
				if (irandom(1) == 0 and infection_level < 3) infection_level = 3;
			}
			else if (irandom(2) == 0 and infection_level == 0) infection_level = 1;
		}
	
		else if (DTO < 30){
			if (npc_infection_level > 2){
				if (irandom(2) == 0 and infection_level < 3) infection_level = 3;
			}
			else if (irandom(4) == 0 and infection_level == 0) infection_level = 1;
		}
	
		else if (DTO < 50){
			if (npc_infection_level > 2){
				if (irandom(5) == 0 and infection_level == 0) infection_level = 1;
			}
		}
	}
	scr_update_infection_level(infection_level);
}
#endregion

#region Manage Object interaction
nearestObject = instance_nearest(x,y,obj_interactable);
if(nearestObject != currentNearestObject){
	with(currentNearestObject){
		sprite_index = choose(object1);
	}
	currentNearestObject = nearestObject;
}
if(distance_to_object(nearestObject) < interactRange){
	
	// Check for role here
	var has_task = false;
	
	// TODO: This is here for the demo. Remove.
	//has_task = true;
	
	open_tasks = ds_map_find_value(con_game_manager.role_to_tasks_map, role);
	for (i = 0; i < ds_list_size(open_tasks); i++){
		if (ds_list_find_value(open_tasks, i) == nearestObject.task) has_task = true;
	}	
	
	if(keyboard_check_released(vk_space) and !global.paused){
		
		if (nearestObject.contaminated and infection_level == 0) infection_level = 1;
		// Run object script
		if(has_task) script_execute(nearestObject.myscript, nearestObject);
		//show_debug_message("Object interact distance: " + string(distance_to_object(nearestObject)))
	
	}
	
	if(has_task){
		with(nearestObject){
			sprite_index = choose(object2);
		}
	}
} 
else {
	with(nearestObject){
		sprite_index = choose(object1);
    }
}
#endregion
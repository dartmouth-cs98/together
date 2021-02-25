/// @description Move the NPC as appropriate
if (moving) {
	
	// If we've reached our target node...
	//if (x = next_node.x && y = next_node.y) {
	if (distance_to_object(next_node) <= 3) {
		prev_node = current_node;
		current_node = next_node;
		
		
		// ...choose next node to go to.
		if (mode = npc_mode.random_walk) {
			#region Random walk
			next_node = ds_list_find_value(current_node.neighbors, irandom(ds_list_size(current_node.neighbors) - 1));
			// If you have multiple neighbors...
			if (ds_list_size(current_node.neighbors) > 1) {
				// ...don't go back to the one you just came from.
				while (next_node == prev_node) {
					next_node = ds_list_find_value(current_node.neighbors, irandom(ds_list_size(current_node.neighbors) - 1));
				}
			}
			#endregion
		}
		
		else if (mode = npc_mode.random_target_bfs) {
			#region Random target BFS
			if (ds_list_size(path) <= 0) {
				/*
				show_debug_message("=========================================================");
				show_debug_message("NPC " + string(self.id) + " has finished its bellman-ford path!");
				show_debug_message("Final Coordinates: " + string(x) + "," + string(y));
				show_debug_message("=========================================================");
				*/
				target_node = ds_list_find_value(con_npc_graph.node_list, random_range(0, ds_list_size(con_npc_graph.node_list) - 1));
				path = scr_bellman_ford(current_node, target_node);
				//moving = false;
				//speed = 0;
				//exit;
			}
			next_node = ds_list_find_value(path, 0);
			ds_list_delete(path, 0);
			#endregion
		}
		
		else {
			#region mode not recognized
			/*
			show_debug_message("=========================================================");
			show_debug_message("NPC ERROR: mode not recognized in step event");
			show_debug_message("mode = " + string(mode));
			show_debug_message("=========================================================");
			*/
			#endregion
		}
		
		ds_list_copy(current_neighbors, current_node.neighbors);
		num_neighbors = ds_list_size(current_neighbors);
		move_dir = point_direction(x, y, next_node.x, next_node.y);
	}
	
	/*
	//var move_dir = point_direction(0, 0, h_input, v_input);
	var move_x = lengthdir_x(walk_speed, move_dir);
	var move_y = lengthdir_y(walk_speed, move_dir);	
	*/
	var dist;
	if (distance_to_object(next_node) < walk_speed) {
		dist = distance_to_object(next_node);
	} else {
		dist = walk_speed;
	}
	move_towards_point(next_node.x, next_node.y, dist);
	var move_x = lengthdir_x(dist, move_dir);
	var move_y = lengthdir_y(dist, move_dir);
	
	#region Change which direction the NPC sprite is facing
	if (move_dir < 0) {
		// Error: move_dir too low
		/*
		show_debug_message("=========================================================");
		show_debug_message("NPC ERROR: move_dir is less than 0. That shouldn't happen");
		show_debug_message("move_dir = " + string(move_dir));
		show_debug_message("=========================================================");
		*/
	
	} else if (move_dir >= 360) {
		// Error: move_dir too high
		/*
		show_debug_message("===========================================================");
		show_debug_message("NPC ERROR: move_dir is more than 359. That shouldn't happen");
		show_debug_message("move_dir = " + string(move_dir));
		show_debug_message("===========================================================");
		*/
	
	} else if ((move_dir > 315 and move_dir < 360) or (move_dir >= 0 and move_dir < 45)) {
		// Face right
		y_frame = 2;
		
	} else if (move_dir >= 45 and move_dir < 135) {
		// Face up
		y_frame = 3;
		
	} else if (move_dir >= 135 and move_dir < 225) {
		// Face left
		y_frame = 1;
		
	} else if (move_dir >= 225 and move_dir < 315) {
		// Face down
		y_frame = 0;
		
	} else {
		// Error: Something weird happened
		/*
		show_debug_message("=================================================================");
		show_debug_message("NPC ERROR: We somehow got to the last case. That shouldn't happen");
		show_debug_message("move_dir = " + string(move_dir));
		show_debug_message("=================================================================");
		*/
		
	}
	
	
	/*
	// Old direction-control code
	switch(move_dir) {
		case 0:		y_frame = 2; break;	// Right		Sprite: Right
		case 45:	y_frame = 2; break;	// Up-Right		Sprite: Right
		case 90:	y_frame = 3; break;	// Up			Sprite: Up
		case 135:	y_frame = 1; break;	// Up-Left		Sprite: Left
		case 180:	y_frame = 1; break;	// Left			Sprite: Left
		case 225:	y_frame = 1; break;	// Down-Left	Sprite: Left
		case 270:	y_frame = 0; break;	// Down			Sprite: Down
		case 315:	y_frame = 2; break;	// Down-Right	Sprite: Right
	}
	*/
	#endregion
	
	
	// Progress the walk animation
	x_frame += anim_speed/room_speed;
	if (x_frame >= anim_length) { x_frame = 0; }
	// Broadcast movement to all players
	for(var i = 0; i < ds_list_size(con_server.socket_list); i++) {
				
		var _sock = ds_list_find_value(con_server.socket_list, i);
				
		buffer_seek(con_server.server_buffer, buffer_seek_start, 0);			// Start from top of buffer
		buffer_write(con_server.server_buffer, buffer_u8, network.npc_move);	// Message ID
		
		buffer_write(con_server.server_buffer, buffer_u32, self);				// ID of the moving NPC
		buffer_write(con_server.server_buffer, buffer_f32, move_x);				// X movement
		buffer_write(con_server.server_buffer, buffer_f32, move_y);				// Y movement
		buffer_write(con_server.server_buffer, buffer_f32, x_frame);				// Where along the walk animation should the npc be?
		buffer_write(con_server.server_buffer, buffer_f32, y_frame);				// Which direction should the npc face?
		
		network_send_packet(_sock, con_server.server_buffer, buffer_tell(con_server.server_buffer));
		//show_debug_message("SEND: npc_move: "+string(current_time));
	}
	
} else {
	x_frame = 0.9; // Reset to idle, but high to prevent sliding
}
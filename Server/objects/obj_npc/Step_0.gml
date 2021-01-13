/// @description Move the NPC as appropriate
if (moving) {
	// If we've reached our target node...
	//if (x = next_node.x && y = next_node.y) {
	if (distance_to_object(next_node) <= 3) {
		
		prev_node = current_node;
		current_node = next_node;
		
		// ...choose next node to go to
		//next_node = ds_list_find_value(current_node.neighbors, irandom(ds_list_size(current_node.neighbors) - 1));
		
		
		// Only go back to prev_node if that's the only way you can go.
		if (num_neighbors == 1) {
			next_node = ds_list_find_value(current_neighbors, 0);
		} else {
			next_node = ds_list_find_value(current_node.neighbors, irandom(ds_list_size(current_node.neighbors) - 1));
			while (next_node == prev_node) {
				next_node = ds_list_find_value(current_node.neighbors, irandom(ds_list_size(current_node.neighbors) - 1));
			}
		}
		
		
		ds_list_copy(current_neighbors, current_node.neighbors);
		num_neighbors = ds_list_size(current_neighbors);
		move_dir = point_direction(x, y, next_node.x, next_node.y);
	}
	
	/*
	//var move_dir = point_direction(0, 0, h_input, v_input);
	var move_x = lengthdir_x(walk_speed, move_dir);
	var move_y = lengthdir_y(walk_speed, move_dir);	
	
	x += move_x;
	y += move_y;
	*/
	
	if (distance_to_object(next_node) < walk_speed) {
		move_towards_point(next_node.x, next_node.y, distance_to_object(next_node));
	} else {
		move_towards_point(next_node.x, next_node.y, walk_speed);
	}
				
	// Change which direction the NPC sprite is facing
	switch(move_dir) {
		case 0:		y_frame = 2; break;	// Right
		case 45:	y_frame = 2; break;	// Up-Right
		case 90:	y_frame = 3; break;	// Up
		case 135:	y_frame = 1; break;	// Up-Left
		case 180:	y_frame = 1; break;	// Left
		case 225:	y_frame = 1; break;	// Down-Left
		case 270:	y_frame = 0; break;	// Down
		case 315:	y_frame = 2; break;	// Down-Right
	}
							
	// Progress the walk animation
	x_frame += anim_speed/room_speed;
	if (x_frame >= anim_length) { x_frame = 0; }
	
	// Broadcast movement to all players
	for(var i = 0; i < ds_list_size(con_server.socket_list); i++) {
				
		var _sock = ds_list_find_value(con_server.socket_list, i);
				
		buffer_seek(con_server.server_buffer, buffer_seek_start, 0);			// Start from top of buffer
		buffer_write(con_server.server_buffer, buffer_u8, network.npc_move);	// Message ID

		buffer_write(con_server.server_buffer, buffer_u8, self);				// ID of the moving NPC
		buffer_write(con_server.server_buffer, buffer_s16, move_x);				// X movement
		buffer_write(con_server.server_buffer, buffer_s16, move_y);				// Y movement
		buffer_write(con_server.server_buffer, buffer_u8, x_frame);				// Where along the walk animation should the npc be?
		buffer_write(con_server.server_buffer, buffer_u8, y_frame);				// Which direction should the npc face?
		
		network_send_packet(_sock, con_server.server_buffer, buffer_tell(con_server.server_buffer));
		//show_debug_message("SEND: npc_move: "+string(current_time));
	}
	
} else {
	x_frame = 0.9; // Reset to idle, but high to prevent sliding
}
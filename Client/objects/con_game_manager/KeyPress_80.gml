/// @description Open pause menu
show_debug_message("REACHED")
if (room == rm_client) {
	if (!paused) {
		// Tell server we paused
		//show_debug_message("SEND: pause: "+string(current_time));
		buffer_seek(con_client.client_buffer, buffer_seek_start, 0);
		buffer_write(con_client.client_buffer, buffer_u8, network.pause);
		network_send_packet(con_client.client, con_client.client_buffer, buffer_tell(con_client.client_buffer));
		
		// Store info about player so they remain visible while paused
		var player = instance_find(obj_player, 0);
		player_data[0] = player.sprite_index;
		player_data[1] = player.image_index;
		player_data[2] = player.x;
		player_data[3] = player.y;
		player_data[4] = player.image_xscale;
		player_data[5] = player.image_yscale;
		player_data[6] = player.image_angle;
		player_data[7] = player.image_blend;
		player_data[8] = player.image_alpha;
		
		instance_deactivate_object(obj_player);
		paused = true;
		
	} else {
		// Tell server we unpaused
		//show_debug_message("SEND: unpause: "+string(current_time));
		buffer_seek(con_client.client_buffer, buffer_seek_start, 0);
		buffer_write(con_client.client_buffer, buffer_u8, network.unpause);
		network_send_packet(con_client.client, con_client.client_buffer, buffer_tell(con_client.client_buffer));
		
		instance_activate_object(obj_player);
		paused = false;
		player_data = 0; // Clear out data from the array
	}
}
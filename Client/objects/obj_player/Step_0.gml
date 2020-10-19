/// @description Every frame

#region Manage 8-directional movement, based on this video: https://www.youtube.com/watch?v=0-a0Fak7cjk

h_input = keyboard_check(vk_right) - keyboard_check(vk_left);
v_input = keyboard_check(vk_down) - keyboard_check(vk_up);

if (h_input != 0 || v_input != 0) {
	move_dir = point_direction(0, 0, h_input, v_input);
	move_x = lengthdir_x(walk_speed, move_dir);
	move_y = lengthdir_y(walk_speed, move_dir);	
	
	// Go to start of buffer
	buffer_seek(con_client.client_buffer, buffer_seek_start, 0);

	// Write to buffer (message ID)
	buffer_write(con_client.client_buffer, buffer_u8, network.move);

	// Send (x,y) coordinates of where you want to move & direction (for sprites)
	buffer_write(con_client.client_buffer, buffer_s16, move_x);
	buffer_write(con_client.client_buffer, buffer_s16, move_y);
	buffer_write(con_client.client_buffer, buffer_s16, move_dir);

	// Send the packet
	network_send_packet(con_client.client, con_client.client_buffer, buffer_tell(con_client.client_buffer));
	//show_debug_message("SEND: move: "+string(current_time));
} else {
	image_index = 0;	// For changing which frame of the sprite we're on
}

#endregion
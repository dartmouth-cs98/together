// @description Toggle unpause

function scr_unpause(){
	// Tell server we unpaused
	//show_debug_message("SEND: unpause: "+string(current_time));
	buffer_seek(con_client.client_buffer, buffer_seek_start, 0);
	buffer_write(con_client.client_buffer, buffer_u8, network.unpause);
	network_send_packet(con_client.client, con_client.client_buffer, buffer_tell(con_client.client_buffer));
	
	//obj_player.image_speed = obj_player.default_image_speed;
	global.paused = false;
}
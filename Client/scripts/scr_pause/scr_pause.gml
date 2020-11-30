// @description Toggle pause

function scr_pause(){
	// Tell server we paused
	buffer_seek(con_client.client_buffer, buffer_seek_start, 0);
	buffer_write(con_client.client_buffer, buffer_u8, network.pause);
	network_send_packet(con_client.client, con_client.client_buffer, buffer_tell(con_client.client_buffer));
	
	obj_player.image_speed = 0;
	obj_player.image_index = 0;
	obj_player.h_input = 0;
	obj_player.v_input = 0;
	
	global.paused = true;
}
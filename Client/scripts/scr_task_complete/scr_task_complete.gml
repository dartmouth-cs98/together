/// @description Send task completion
function scr_task_complete(value){
	buffer_seek(con_client.client_buffer, buffer_seek_start, 0);		// Go to start of buffer
	buffer_write(con_client.client_buffer, buffer_u8, network.task);	// ID

	buffer_write(con_client.client_buffer, buffer_u8, value);		// Add to taskbar
	network_send_packet(con_client.client, con_client.client_buffer, buffer_tell(con_client.client_buffer));
}
// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_duotask_on(object){
	buffer_seek(con_client.client_buffer, buffer_seek_start, 0);		// Go to start of buffer
	buffer_write(con_client.client_buffer, buffer_u8, network.duotask);	// ID

	buffer_write(con_client.client_buffer, buffer_u32, object);			// Send object id
	buffer_write(con_client.client_buffer, buffer_u8, 1);						// Send player getting on task
	
	network_send_packet(con_client.client, con_client.client_buffer, buffer_tell(con_client.client_buffer));
}
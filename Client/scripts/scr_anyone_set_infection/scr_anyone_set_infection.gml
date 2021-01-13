// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_anyone_set_infection(player, infection_level){

	player.infection_level = infection_level;
	buffer_seek(con_client.client_buffer, buffer_seek_start, 0);		// Start from top of buffer
	buffer_write(con_client.client_buffer, buffer_u8, network.update_infection_level);	// Message ID
	buffer_write(con_client.client_buffer, buffer_u8, infection_level);	// Infection level

	network_send_packet(con_client.client, con_client.client_buffer, buffer_tell(con_client.client_buffer));
}
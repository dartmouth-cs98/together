/// @description Insert description here
// You can write your code in this editor

if (npc_infection_level < 4) npc_infection_level++;

for(var i = 0; i < ds_list_size(socket_list); i++) {
	var _sock = ds_list_find_value(socket_list, i);
	buffer_seek(server_buffer, buffer_seek_start, 0);
	buffer_write(server_buffer, buffer_u8, network.update_npc_infection_level);
	buffer_write(server_buffer, buffer_u8, npc_infection_level);
	network_send_packet(_sock, server_buffer, buffer_tell(server_buffer));
}
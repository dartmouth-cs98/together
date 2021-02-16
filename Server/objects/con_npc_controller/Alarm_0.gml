/// @description Insert description here
// You can write your code in this editor

if (npc_infection_level < 4) npc_infection_level++;

for(var i = 0; i < ds_list_size(con_server.socket_list); i++) {
	var _sock = ds_list_find_value(con_server.socket_list, i);
	buffer_seek(con_server.server_buffer, buffer_seek_start, 0);
	buffer_write(con_server.server_buffer, buffer_u8, network.update_npc_infection_level);
	buffer_write(con_server.server_buffer, buffer_u8, npc_infection_level);
	network_send_packet(_sock, con_server.server_buffer, buffer_tell(con_server.server_buffer));
}
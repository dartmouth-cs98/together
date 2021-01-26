/// @description Insert description here
// You can write your code in this editor

randomize();
if (current_player_number > 4){

	if (irandom(3) == 0){
		
		// Choose and send a random event
		var event = irandom(2);

		for(var i = 0; i < ds_list_size(socket_list); i++) {
			var _sock = ds_list_find_value(socket_list, i);
			buffer_seek(server_buffer, buffer_seek_start, 0);
			buffer_write(server_buffer, buffer_u8, network.event);
			buffer_write(server_buffer, buffer_u8, event);
			network_send_packet(_sock, server_buffer, buffer_tell(server_buffer));
		}
	}
}
/// @description Parse client information

// Async makes a ds_map w/ a bunch of info in it
type_event = ds_map_find_value(async_load, "type");

switch(type_event) {
	
	case network_type_connect:
		// When you get a connect message, add the client to the list
		socket = ds_map_find_value(async_load, "socket");
		ds_list_add(socket_list, socket);
		if (current_player_number < max_clients){
			current_player_number++;
			buffer_seek(server_buffer, buffer_seek_start, 0);
			buffer_write(server_buffer, buffer_u8, network.player_establish);
			buffer_write(server_buffer, buffer_u8, socket);
			network_send_packet(socket, server_buffer, buffer_tell(server_buffer));
			//show_debug_message("SEND: player_establish: "+string(current_time));
		}
		else {
			
			buffer_seek(server_buffer, buffer_seek_start, 0);
			buffer_write(server_buffer, buffer_u8, network.player_denied);
			network_send_packet(socket, server_buffer, buffer_tell(server_buffer));
		}
		
		break;
		
	case network_type_disconnect:
		// When you get a disconnect message, remove the client from the list
		socket = ds_map_find_value(async_load, "socket");
		ds_list_delete(socket_list, ds_list_find_index(socket_list, socket));
		
		
		// Broadcast which player disconnected
		for(var i = 0; i < ds_list_size(socket_list); i++) {
			var _sock = ds_list_find_value(socket_list, i);
			buffer_seek(server_buffer, buffer_seek_start, 0);
			buffer_write(server_buffer, buffer_u8, network.player_disconnect);
			buffer_write(server_buffer, buffer_u8, socket);
			network_send_packet(_sock, server_buffer, buffer_tell(server_buffer));
			//show_debug_message("SEND: player_disconnect: "+string(current_time));
		}
		
		// Make the player destroy itself
		if (ds_map_find_value(socket_to_instanceid, socket) != noone and !is_undefined(ds_map_find_value(socket_to_instanceid, socket))){
			with (ds_map_find_value(socket_to_instanceid, socket)) {
				instance_destroy();	
			}
			ds_map_delete(socket_to_instanceid, socket);
		}
		current_player_number--;
		
		break;
		
	case network_type_data:
		// When you get data, send out the appropriate messages
		buffer = ds_map_find_value(async_load, "buffer");
		socket = ds_map_find_value(async_load, "id");
		scr_received_packet(buffer, socket);
		break;
}
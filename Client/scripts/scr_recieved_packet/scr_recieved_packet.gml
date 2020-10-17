/// @description Determine what to do based on data recieved
function scr_recieved_packet(buffer){
	msgid = buffer_read(buffer, buffer_u8);
	
	switch(msgid) {
		case network.player_establish:
			show_debug_message("RECIEVE: player_establish: "+string(current_time));
			
			var _socket = buffer_read(buffer, buffer_u8);
			// This is this client's socket, put in a global variable to the client can always access it.
			global.mysocket = _socket;
			
			buffer_seek(client_buffer, buffer_seek_start, 0);
			buffer_write(client_buffer, buffer_u8, network.player_establish);
			buffer_write(client_buffer, buffer_string, con_game_manager.username);
			network_send_packet(client, client_buffer, buffer_tell(client_buffer));
			show_debug_message("SEND: player_establish: "+string(current_time));
			
			break;
		
		
		case network.player_connect: // The ID for player_connect is 1, as defined in the enum from the create method
			show_debug_message("RECIEVE: player_connect: "+string(current_time));
			
			// When a player connects, get their info & put them in appropriate data structures
			var _socket = buffer_read(buffer, buffer_u8);
			var _x = buffer_read(buffer, buffer_u16);
			var _y = buffer_read(buffer, buffer_u16);
			var _username = buffer_read(buffer, buffer_string);
			
			var _player = instance_create_depth(_x, _y, depth, obj_player);
			_player.socket = _socket;
			_player.username = _username;
			
			ds_map_add(socket_to_instanceid, _socket, _player);
			break;
			
		case network.player_joined:
			show_debug_message("RECIEVE: player_joined: "+string(current_time));
			
			var _socket = buffer_read(buffer, buffer_u8);
			var _x = buffer_read(buffer, buffer_u16);
			var _y = buffer_read(buffer, buffer_u16);
			var _username = buffer_read(buffer, buffer_string);
			
			var _other = instance_create_depth(_x, _y, depth, obj_other);
			_other.socket = _socket;
			_other.username = _username;
			ds_map_add(socket_to_instanceid, _socket, _other);
			break;
			
		case network.player_disconnect:
			show_debug_message("RECIEVE: player_disconnect: "+string(current_time));
			
			// Destroy whichever player is disconnected and remove them from the socket map
			var _socket = buffer_read(buffer, buffer_u8);
			var _player = ds_map_find_value(socket_to_instanceid, _socket);
			
			with(_player) {
				instance_destroy();
			}
			
			ds_map_delete(socket_to_instanceid, _socket);
			break;
		
		case network.move: 
			show_debug_message("RECIEVE: move: "+string(current_time));
			
			var _sock = buffer_read(buffer, buffer_u8);
			var move_x = buffer_read(buffer, buffer_u16);
			var move_y = buffer_read(buffer, buffer_u16);
			
			// This is whoever's moving, player or other.
			_player = ds_map_find_value(socket_to_instanceid, _sock);
			_player.x = move_x;
			_player.y = move_y;
			break;
			
		case network.chat:
			show_debug_message("RECIEVE: chat: "+string(current_time));
			
			// Read chat message, put it in the list.
			var _chat = buffer_read(buffer, buffer_string);
			ds_list_insert(global.chat, 0, _chat);
			
			var _colorid = buffer_read(buffer, buffer_u8);
			ds_list_insert(global.chat_color, 0, ds_map_find_value(color_map, _colorid));
			break;
	}
}
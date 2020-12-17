/// @description Manage a player connecting
function scr_network_player_join(_username, _sprite_sheet){
	// Create & set up  `player
	var _player = instance_create_depth(player_spawn_x, player_spawn_y, depth, obj_player);
	_player.username = _username;
	_player.sprite_sheet = _sprite_sheet;
	ds_map_add(socket_to_instanceid, socket, _player);
		
	#region Create obj_player for connecting client
	buffer_seek(server_buffer, buffer_seek_start, 0);
	buffer_write(server_buffer, buffer_u8, network.player_connect);
	buffer_write(server_buffer, buffer_u8, socket);
	buffer_write(server_buffer, buffer_u16, _player.x);
	buffer_write(server_buffer, buffer_u16, _player.y);
	buffer_write(server_buffer, buffer_string, _player.username);
	network_send_packet(socket, server_buffer, buffer_tell(server_buffer));
	//show_debug_message("SEND: player_connect: "+string(current_time));
	#endregion
		
	#region Send info about already present players to the newly connected player
	for(var i = 0; i < ds_list_size(socket_list); i++) {
		var _sock = ds_list_find_value(socket_list, i);
		// Don't broadcast to yourself
		if (_sock != socket) {
			var _other = ds_map_find_value(socket_to_instanceid, _sock);
			buffer_seek(server_buffer, buffer_seek_start, 0);
			buffer_write(server_buffer, buffer_u8, network.player_joined);
			buffer_write(server_buffer, buffer_u8, _sock);
			buffer_write(server_buffer, buffer_u16, _other.x);
			buffer_write(server_buffer, buffer_u16, _other.y);
			buffer_write(server_buffer, buffer_string, _other.username);
			buffer_write(server_buffer, buffer_u8, _other.sprite_sheet);
			network_send_packet(socket, server_buffer, buffer_tell(server_buffer));
			//show_debug_message("SEND: player_joined: "+string(current_time));
		}
	}
	#endregion
		
	#region Broadcast the newly connected player's info at time of joining to all other players
	for(var i = 0; i < ds_list_size(socket_list); i++) {
		var _sock = ds_list_find_value(socket_list, i);
		// Don't broadcast to yourself
		if (_sock != socket) {
			buffer_seek(server_buffer, buffer_seek_start, 0);
			buffer_write(server_buffer, buffer_u8, network.player_joined);
			buffer_write(server_buffer, buffer_u8, socket);
			buffer_write(server_buffer, buffer_u16, _player.x);
			buffer_write(server_buffer, buffer_u16, _player.y);
			buffer_write(server_buffer, buffer_string, _player.username);
			buffer_write(server_buffer, buffer_u8, _sprite_sheet);
			network_send_packet(_sock, server_buffer, buffer_tell(server_buffer));
			//show_debug_message("SEND: player_joined: "+string(current_time));
		}
		
		// Send taskbar info
		if (_sock == socket) {
			buffer_seek(server_buffer, buffer_seek_start, 0);		// Start from top of buffer
			buffer_write(server_buffer, buffer_u8, network.task);	// Message ID
			buffer_write(server_buffer, buffer_u8, global.task);			// Taskbar		
			network_send_packet(_sock, server_buffer, buffer_tell(server_buffer));
		}
	}
	#endregion
}
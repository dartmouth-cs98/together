/// @description Determine what to do based on data recieved
function scr_recieved_packet(buffer, socket){
	msgid = buffer_read(buffer, buffer_u8);
	
	// All the possible things we may need the server to do should be in here
	switch (msgid) {
		case network.player_establish:
			show_debug_message("RECIEVE: player_establish: "+string(current_time));
		
			var _username = buffer_read(buffer, buffer_string);
			scr_network_player_join(_username);
			break;
		
		case network.move:
			show_debug_message("RECIEVE: move: "+string(current_time));
		
			// Make sure your reads & writes match. Write string -> read string.
			var move_x = buffer_read(buffer, buffer_s16);
			var move_y = buffer_read(buffer, buffer_s16);
			var move_dir = buffer_read(buffer, buffer_s16);		// TODO: Use for setting sprite direction
			
			
			
			var _player = ds_map_find_value(socket_to_instanceid, socket)
			with (_player) {
				x += move_x;
				y += move_y;
			}
			
			
			for(var i = 0; i < ds_list_size(socket_list); i++) {
				
				var _sock = ds_list_find_value(socket_list, i);
				
				buffer_seek(server_buffer, buffer_seek_start, 0);		// Start from top of buffer
				buffer_write(server_buffer, buffer_u8, network.move);	// Message ID
				
				buffer_write(server_buffer, buffer_u8, socket);			// Socket of the moving player
				
				buffer_write(server_buffer, buffer_s16, move_x);		// X
				buffer_write(server_buffer, buffer_s16, move_y);		// Y
				buffer_write(server_buffer, buffer_s16, move_dir);		// direction
				
				network_send_packet(_sock, server_buffer, buffer_tell(server_buffer));
				show_debug_message("SEND: move: "+string(current_time));
			}
			break;
			
		case network.chat:
			show_debug_message("RECIEVE: chat: "+string(current_time));
			
			var _chat = buffer_read(buffer, buffer_string);
			var	_player = ds_map_find_value(socket_to_instanceid, socket);
			
			_chat = _player.username + ": " + _chat;					// Append username to show who it's from
			ds_list_insert(global.chat, 0, _chat);
			
			//TODO: Potential issues here, 32:44 in video
			_colorid = buffer_read(buffer, buffer_u8);
			ds_list_insert(global.chat_color, 0, ds_map_find_value(color_map, _colorid))
			
			for(var i = 0; i < ds_list_size(socket_list); i++) {
				
				var _sock = ds_list_find_value(socket_list, i);
				
				buffer_seek(server_buffer, buffer_seek_start, 0);		// Start from top of buffer
				buffer_write(server_buffer, buffer_u8, network.chat);	// Message ID
				buffer_write(server_buffer, buffer_string, _chat);		// Message contents
				buffer_write(server_buffer, buffer_u8, _colorid);		// Message color (number that maps to it)
				
				network_send_packet(_sock, server_buffer, buffer_tell(server_buffer));
				show_debug_message("SEND: chat: "+string(current_time));
			}
			break;
	}
}
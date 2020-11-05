/// @description Determine what to do based on data recieved
function scr_recieved_packet(buffer, socket){
	msgid = buffer_read(buffer, buffer_u8);
	
	// All the possible things we may need the server to do should be in here
	switch (msgid) {
		case network.player_establish:
			#region player_establish
			//show_debug_message("RECIEVE: player_establish: "+string(current_time));
		
			var _username = buffer_read(buffer, buffer_string);
			scr_network_player_join(_username);
			#endregion
			break;
		
		case network.move:
			#region move
			//show_debug_message("RECIEVE: move: "+string(current_time));
			
			// Make sure your reads & writes match. Write string -> read string.
			var h_input = buffer_read(buffer, buffer_s8);
			var v_input = buffer_read(buffer, buffer_s8);
			var walk_speed = buffer_read(buffer, buffer_u8);
			
			var _player = ds_map_find_value(socket_to_instanceid, socket);
			
			// Move the player
			with (_player) {
				if (h_input != 0 or v_input != 0) {
					var move_dir = point_direction(0, 0, h_input, v_input);
					var move_x = lengthdir_x(walk_speed, move_dir);
					var move_y = lengthdir_y(walk_speed, move_dir);	
					
					x += move_x;
					y += move_y;
					
					// Set sprites based on move direction
					switch(move_dir) {
						case 0: sprite_index = spr_r_strip4; break;			// Right
						case 45: sprite_index = spr_ur_strip4; break;		// Up-Right
						case 90: sprite_index = spr_u_strip4; break;		// Up
						case 135: sprite_index = spr_ul_strip4; break;		// Up-Left
						case 180: sprite_index = spr_l_strip4; break;		// Left
						case 225: sprite_index = spr_dl_strip4; break;		// Down-Left
						case 270: sprite_index = spr_d_strip4; break;		// Down
						case 315: sprite_index = spr_dr_strip4; break;		// Down-Right
					}
				} else {
					image_index = 0;
				}
			}
			
			// Broadcast movement to all players
			for(var i = 0; i < ds_list_size(socket_list); i++) {
				
				var _sock = ds_list_find_value(socket_list, i);
				
				buffer_seek(server_buffer, buffer_seek_start, 0);		// Start from top of buffer
				buffer_write(server_buffer, buffer_u8, network.move);	// Message ID
				
				buffer_write(server_buffer, buffer_u8, socket);			// Socket of the moving player
				
				buffer_write(server_buffer, buffer_s8, h_input);		// Horizontal input
				buffer_write(server_buffer, buffer_s8, v_input);		// Vertical input
				buffer_write(server_buffer, buffer_u8, walk_speed);		// Walk speed
				
				network_send_packet(_sock, server_buffer, buffer_tell(server_buffer));
				show_debug_message("SEND: move: "+string(current_time));
			}
			
			#endregion
			break;
			
		case network.chat:
			#region chat
			//show_debug_message("RECIEVE: chat: "+string(current_time));
			
			var _chat = buffer_read(buffer, buffer_string);
			var	_player = ds_map_find_value(socket_to_instanceid, socket);
			
			_chat = _player.username + ": " + _chat;					// Append username to show who it's from
			ds_list_insert(global.chat, 0, _chat);
			
			//TODO: Potential issues here, 32:44 in networking video
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
			#endregion
			break;
    
		case network.task:
			//show_debug_message("RECIEVE: task: "+string(current_time));
			
			var add_to_taskbar = buffer_read(buffer, buffer_u8);

			// Add to total taskbar
			global.task += add_to_taskbar;
			
			// Broadcast taskbar status to all players
			for(var i = 0; i < ds_list_size(socket_list); i++) {
				
				var _sock = ds_list_find_value(socket_list, i);
				
				buffer_seek(server_buffer, buffer_seek_start, 0);		// Start from top of buffer
				buffer_write(server_buffer, buffer_u8, network.task);	// Message ID
				
				buffer_write(server_buffer, buffer_u8, global.task);			// Taskbar
				
				network_send_packet(_sock, server_buffer, buffer_tell(server_buffer));
				//show_debug_message("SEND: task: "+string(current_time));
			}
      break;

		case network.pause:
			#region pause
			show_debug_message("RECIEVE: pause: "+string(current_time));
			
			var _player = ds_map_find_value(socket_to_instanceid, socket);
			
			// Stop player from animating
			_player.image_index = 0;
			_player.image_speed = 0;
			
			// Echo the message out
			for(var i = 0; i < ds_list_size(socket_list); i++) {
				var recipient_socket = ds_list_find_value(socket_list, i);
				
				if (recipient_socket != socket) {
					buffer_seek(server_buffer, buffer_seek_start, 0);
					buffer_write(server_buffer, buffer_u8, network.pause);
					buffer_write(server_buffer, buffer_u8, socket);			// Socket of the pausing player
					network_send_packet(recipient_socket, server_buffer, buffer_tell(server_buffer));
					show_debug_message("SEND: pause: "+string(current_time));
				}
			}
			
			#endregion
			break;
			
		case network.unpause:
			#region unpause
			show_debug_message("RECIEVE: unpause: "+string(current_time));
			
			var _player = ds_map_find_value(socket_to_instanceid, socket);
			
			// Restore normal animation
			_player.image_speed = _player.default_image_speed;
			
			// Echo it out
			for(var i = 0; i < ds_list_size(socket_list); i++) {
				var recipient_socket = ds_list_find_value(socket_list, i);
				
				if (recipient_socket != socket) {
					buffer_seek(server_buffer, buffer_seek_start, 0);
					buffer_write(server_buffer, buffer_u8, network.unpause);
					buffer_write(server_buffer, buffer_u8, socket);			// Socket of the unpausing player
					network_send_packet(recipient_socket, server_buffer, buffer_tell(server_buffer));
					show_debug_message("SEND: unpause: "+string(current_time));
				}
			}
			
			#endregion
			break;
	}
}
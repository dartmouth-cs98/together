/// @description Determine what to do based on data recieved
function scr_received_packet(buffer, socket) {
	buffer_seek(buffer, buffer_seek_start, 0); // Go to start of buffer
	msgid = buffer_read(buffer, buffer_u8);
	
	// All the possible things we may need the server to do should be in here
	switch (msgid) {
		case network.player_establish:
			#region player_establish
			show_debug_message("RECEIVE: player_establish: "+string(current_time));
			
			/*
			var _username = buffer_read(buffer, buffer_string);
			var _sprite_sheet = buffer_read(buffer, buffer_u8);
			scr_network_player_join(_username, _sprite_sheet);
			*/
			
			// If this player's establishment fills the server, tell all the players that the server is now full.
			if (con_server.current_player_number == con_server.max_clients) {
				for(var i = 0; i < ds_list_size(socket_list); i++) {
					var _sock = ds_list_find_value(socket_list, i);
					buffer_seek(server_buffer, buffer_seek_start, 0);				// Start from top of buffer
					buffer_write(server_buffer, buffer_u8, network.server_full);	// Message ID			
					network_send_packet(_sock, server_buffer, buffer_tell(server_buffer));
					show_debug_message("SEND: server_full: "+string(current_time));
				}
			}
			
			#endregion
			break;
		
		case network.server_full:
			#region server_full
			
			show_debug_message("RECEIVE: server_full: "+string(current_time));
			var _username = buffer_read(buffer, buffer_string);
			var _sprite_sheet = buffer_read(buffer, buffer_u8);
			scr_network_player_join(_username, _sprite_sheet);
			
			#endregion
			break;
		
		case network.move:
			#region move
			show_debug_message("RECEIVE: move: "+string(current_time));
			
			// Make sure your reads & writes match. Write string -> read string.
			var h_input = buffer_read(buffer, buffer_s8);
			var v_input = buffer_read(buffer, buffer_s8);
			var walk_speed = buffer_read(buffer, buffer_u8);
			
			var _player = ds_map_find_value(socket_to_instanceid, socket);
			
			// Move the player
			if (global.show_visuals) {
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
			//show_debug_message("RECEIVE: chat: "+string(current_time));
			
			var _chat = buffer_read(buffer, buffer_string);
			var	_player = ds_map_find_value(socket_to_instanceid, socket);
			
			_chat = _player.username + ":" + _chat;					// Append username to show who it's from
			ds_list_insert(global.chat, 0, _chat);
			
			//TODO: Potential issues here, 32:44 in networking video (https://youtu.be/NbsXRuNijlo) (Could be another one in the series)
			var _color1 = buffer_read(buffer, buffer_u8);
			var _color2 = buffer_read(buffer, buffer_u8);
			var _color3 = buffer_read(buffer, buffer_u8);
			ds_list_insert(global.chat_color, 0, make_color_rgb(_color1, _color2, _color3));
			
			for(var i = 0; i < ds_list_size(socket_list); i++) {
				
				var _sock = ds_list_find_value(socket_list, i);
				
				buffer_seek(server_buffer, buffer_seek_start, 0);		// Start from top of buffer
				buffer_write(server_buffer, buffer_u8, network.chat);	// Message ID
				buffer_write(server_buffer, buffer_string, _chat);		// Message contents
				buffer_write(server_buffer, buffer_u8, _color1);		// Message color (number that maps to it)
				buffer_write(server_buffer, buffer_u8, _color2);		// Message color (number that maps to it)
				buffer_write(server_buffer, buffer_u8, _color3);		// Message color (number that maps to it)
				network_send_packet(_sock, server_buffer, buffer_tell(server_buffer));
				//show_debug_message("SEND: chat: "+string(current_time));
			}
			#endregion
			break;
    
		case network.task:
			#region task
			//show_debug_message("RECEIVE: task: "+string(current_time));
			
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
			#endregion
			break;
			
		case network.pause:
			#region pause
			//show_debug_message("RECEIVE: pause: "+string(current_time));
			
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
					//show_debug_message("SEND: pause: "+string(current_time));
				}
			}
			
			#endregion
			break;
			
		case network.unpause:
			#region unpause
			//show_debug_message("RECEIVE: unpause: "+string(current_time));
			
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
					//show_debug_message("SEND: unpause: "+string(current_time));
				}
			}
			
			#endregion
			break;
		
		case network.revive:
			#region revive
			
			#endregion
			break;
		
		case network.update_infection_level:
			#region update_infection_level
			var _player = ds_map_find_value(socket_to_instanceid, socket);
			var infection_level = buffer_read(buffer, buffer_u8);
			
			// Echo it out
			for(var i = 0; i < ds_list_size(socket_list); i++) {
				var recipient_socket = ds_list_find_value(socket_list, i);
				
				if (recipient_socket != socket) {
					buffer_seek(server_buffer, buffer_seek_start, 0);
					buffer_write(server_buffer, buffer_u8, network.update_infection_level);
					buffer_write(server_buffer, buffer_u8, socket);			// Socket of the unpausing player
					buffer_write(server_buffer, buffer_u8, infection_level);
					network_send_packet(recipient_socket, server_buffer, buffer_tell(server_buffer));
					//show_debug_message("SEND: unpause: "+string(current_time));
				}
			}
			
			#endregion
			break;
		
		case network.duotask:
			#region duotask
			//show_debug_message("RECEIVE: duotask: " + string(current_time));
			
			var object_id = buffer_read(buffer, buffer_u32);
			var add = buffer_read(buffer, buffer_s8);
			
			//show_debug_message("add is " + string(add));

			if ds_map_exists(global.duotask_map, object_id){
				if ((ds_map_find_value(global.duotask_map, object_id) == 0) && (add == 1)){
					//show_debug_message("add 1 player");
					ds_map_replace(global.duotask_map, object_id, 1);
				}
				
				else if ((ds_map_find_value(global.duotask_map, object_id) == 1) && (add == -1)) {
					//show_debug_message("remove 1 player");
					ds_map_replace(global.duotask_map, object_id, 0);
				}
				
				else if ((ds_map_find_value(global.duotask_map, object_id) == 1) && (add == 1)) {
					//show_debug_message("complete duotask");
					ds_map_replace(global.duotask_map, object_id, 0);

					// Broadcast completion status to all players
					for(var i = 0; i < ds_list_size(socket_list); i++) {

						var _sock = ds_list_find_value(socket_list, i);

						buffer_seek(server_buffer, buffer_seek_start, 0);			// Start from top of buffer
						buffer_write(server_buffer, buffer_u8, network.duotask);	// Message ID

						buffer_write(server_buffer, buffer_u32, object_id);			// Send back object id
				
						network_send_packet(_sock, server_buffer, buffer_tell(server_buffer));
					}
				}
				
			} else if (add == 1) {
				//show_debug_message("add new object");
				ds_map_add(global.duotask_map, object_id, 1);
			}
			#endregion
			break;
	}
}
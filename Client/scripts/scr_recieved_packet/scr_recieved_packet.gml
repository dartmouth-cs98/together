/// @description Determine what to do based on data recieved
function scr_recieved_packet(buffer){
	msgid = buffer_read(buffer, buffer_u8);
	
	switch(msgid) {
		case network.player_establish:
			#region player_establish
			//show_debug_message("RECIEVE: player_establish: "+string(current_time));
			
			var _socket = buffer_read(buffer, buffer_u8);
			
			// This is this client's socket, put in a global variable to the client can always access it.
			global.mysocket = _socket;
			
			buffer_seek(client_buffer, buffer_seek_start, 0);
			buffer_write(client_buffer, buffer_u8, network.player_establish);
			buffer_write(client_buffer, buffer_string, con_game_manager.username);
			buffer_write(client_buffer, buffer_u8, con_game_manager.player_sprite);
			network_send_packet(client, client_buffer, buffer_tell(client_buffer));
			//show_debug_message("SEND: player_establish: "+string(current_time));
			#endregion
			break;
		
		case network.player_connect:
			#region player_connect
			show_debug_message("RECIEVE: player_connect: "+string(current_time));
			
			// When a player connects, get their info & put them in appropriate data structures
			var _socket = buffer_read(buffer, buffer_u8);
			var _x = buffer_read(buffer, buffer_u16);
			var _y = buffer_read(buffer, buffer_u16);
			var _username = buffer_read(buffer, buffer_string);
			var _player = instance_create_depth(_x, _y, depth, obj_player);
			_player.socket = _socket;
			_player.username = _username;
			_player.image_index = 0;
			
			ds_map_add(socket_to_instanceid, _socket, _player);
			#endregion
			break;
			
		case network.player_joined:
			#region player_joined
			//show_debug_message("RECIEVE: player_joined: "+string(current_time));
			
			var _socket = buffer_read(buffer, buffer_u8);
			var _x = buffer_read(buffer, buffer_u16);
			var _y = buffer_read(buffer, buffer_u16);
			var _username = buffer_read(buffer, buffer_string);
			var _sprite_sheet = buffer_read(buffer, buffer_u8);
			var _other = instance_create_depth(_x, _y, depth, obj_other);
			_other.socket = _socket;
			_other.username = _username;
			_other.sprite_sheet = _sprite_sheet;
			_other.image_index = 0;
			ds_map_add(socket_to_instanceid, _socket, _other);
			#endregion
			break;
			
		case network.player_disconnect:
			#region player_disconnect
			//show_debug_message("RECIEVE: player_disconnect: "+string(current_time));
			
			// Destroy whichever player is disconnected and remove them from the socket map
			var _socket = buffer_read(buffer, buffer_u8);
			var _player = ds_map_find_value(socket_to_instanceid, _socket);
			
			with(_player) {
				instance_destroy();
			}
			
			ds_map_delete(socket_to_instanceid, _socket);
			#endregion
			break;
		
		case network.move: 
			#region move
			//show_debug_message("RECIEVE: move: "+string(current_time));
			
			var _sock = buffer_read(buffer, buffer_u8);
			var h_input = buffer_read(buffer, buffer_s8);
			var v_input = buffer_read(buffer, buffer_s8);
			var walk_speed = buffer_read(buffer, buffer_u8);
			
			// This is whoever's moving, player or other.
			_player = ds_map_find_value(socket_to_instanceid, _sock);
			if (!is_undefined(_player)) {
				with (_player) {
					
					#region Set sprite direction based on movement
					if (h_input != 0 || v_input != 0) {
						var move_dir = point_direction(0, 0, h_input, v_input);
						var move_x = lengthdir_x(walk_speed, move_dir);
						var move_y = lengthdir_y(walk_speed, move_dir);	
					
						x += move_x;
						y += move_y;
						
						// Change which direction the player sprite is facing
						switch(move_dir) {
							case 0:		y_frame = 2; break;	// Right
							case 45:	y_frame = 2; break;	// Up-Right
							case 90:	y_frame = 3; break;	// Up
							case 135:	y_frame = 1; break;	// Up-Left
							case 180:	y_frame = 1; break;	// Left
							case 225:	y_frame = 1; break;	// Down-Left
							case 270:	y_frame = 0; break;	// Down
							case 315:	y_frame = 2; break;	// Down-Right
						}
							
						// Progress the walk animation
						x_frame += anim_speed/room_speed;
						if (x_frame >= anim_length) { x_frame = 0 };
					} else {
						x_frame = 0.9; // Reset to idle, but high to prevent sliding
					}
					#endregion
				}
			}
			
			#region Have camera follow player
			with (con_camera) {
				if (instance_exists(target)){
					// Center on player
					global.cam_X = target.x - (global.cam_width/2);
					global.cam_Y = target.y - (global.cam_height/2);
	
					// Clamp camera at edges edges are clear
					global.cam_X = clamp(global.cam_X, 0, room_width-global.cam_width);
					global.cam_Y = clamp(global.cam_Y, 0, room_height-global.cam_height);
				}
				camera_set_view_pos(view_camera[0], global.cam_X, global.cam_Y);
			}
			#endregion
			
			#endregion
			break;
			
		case network.chat:
			#region chat
			//show_debug_message("RECIEVE: chat: "+string(current_time));
			
			// Read chat message, put it in the list.
			var _chat = buffer_read(buffer, buffer_string);
			ds_list_insert(global.chat, 0, _chat);
			
			var _colorid = buffer_read(buffer, buffer_u8);
			ds_list_insert(global.chat_color, 0, ds_map_find_value(color_map, _colorid));
			#endregion
			break;
      
		case network.task:
			#region task
			var taskbar = buffer_read(buffer, buffer_u8);
			global.taskbar = taskbar;
			if (global.taskbar >= global.taskbar_max) {
				//
				
				room_goto(rm_win_screen);
			}
			//show_debug_message("Taskbar: " + string(taskbar))
			#endregion
			break;

		case network.pause:
			#region pause
			//show_debug_message("RECIEVE: pause: "+string(current_time));
			
			var pause_socket = buffer_read(buffer, buffer_u8);
			var _player = ds_map_find_value(socket_to_instanceid, pause_socket);
			_player.image_index = 0;
			_player.image_speed = 0;
			
			#endregion
			break;
			
		case network.unpause:
			#region unpause
			//show_debug_message("RECIEVE: unpause: "+string(current_time));
			
			var unpause_socket = buffer_read(buffer, buffer_u8);
			var _player = ds_map_find_value(socket_to_instanceid, unpause_socket);
			_player.image_speed = _player.default_image_speed;
			
			#endregion
			break;
	}
}
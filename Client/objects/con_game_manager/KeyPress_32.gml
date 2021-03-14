/// @description On space, switch rooms based on current room

switch (room) {
	case rm_main_menu:
		/*
		room_goto(rm_sprite_select);
		window_set_size(1366,768);
		surface_resize(application_surface,1366,768);
		display_set_gui_size(1366,768);
		*/
		break;
	
	case rm_wait:
		buffer_seek(con_client.client_buffer, buffer_seek_start, 0);
		buffer_write(con_client.client_buffer, buffer_u8, network.start_early);
		network_send_packet(con_client.client, con_client.client_buffer, buffer_tell(con_client.client_buffer));
		break;
		
	default:
		break;
}
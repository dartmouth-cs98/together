/// @description Turn chat on/off

if (show_chat){

	buffer_seek(con_client.client_buffer, buffer_seek_start, 0);		// Start from top of buffer
	buffer_write(con_client.client_buffer, buffer_u8, network.chat);	// Message ID
	buffer_write(con_client.client_buffer, buffer_string, chat_text);	// Message contents
	buffer_write(con_client.client_buffer, buffer_u8, client_color_1);	// Message color
	buffer_write(con_client.client_buffer, buffer_u8, client_color_2);	// Message color
	buffer_write(con_client.client_buffer, buffer_u8, client_color_3);	// Message color
	network_send_packet(con_client.client, con_client.client_buffer, buffer_tell(con_client.client_buffer));
	show_debug_message("SEND: chat: "+string(current_time));
	
	keyboard_string = "";
	chat_text = "";
}
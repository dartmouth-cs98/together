/// @description Set up the chat
// I turned this off since we're not working on chat, and this is just causing grief
global.chat = ds_list_create();
global.chat_color = ds_list_create();

randomize();
//client_color_id = make_colour_rgb(irandom(255), irandom(255), irandom(255));
client_color_1 = irandom(255);
client_color_2 = irandom(255);
client_color_3 = irandom(255);
/*
buffer_seek(con_client.client_buffer, buffer_seek_start, 0);			// Start from top of buffer
buffer_write(con_client.client_buffer, buffer_u8, network.chat_rgb);	// Message ID
buffer_write(con_client.client_buffer, buffer_u8, client_color_1);		// Message contents
buffer_write(con_client.client_buffer, buffer_u8, client_color_2);		// Message contents
buffer_write(con_client.client_buffer, buffer_u8, client_color_3);		// Message contents
network_send_packet(con_client.client, con_client.client_buffer, buffer_tell(con_client.client_buffer));
*/

show_chat = false;

active = false;		// Turn chat on/off. Default to false.

chat_size = 10;		// # of visible chat messages
repeat(chat_size) {
	ds_list_add(global.chat,"");
	ds_list_add(global.chat_color, ds_map_find_value(con_client.color_map, colors.black));
}

chat_text = "";		// Current chat message
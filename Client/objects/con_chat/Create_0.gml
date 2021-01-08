/// @description Set up the chat

global.chat = ds_list_create();
global.chat_color = ds_list_create();

randomize();
client_color_1 = irandom(255);
client_color_2 = irandom(255);
client_color_3 = irandom(255);

show_chat = false;

chat_size = 10;		// # of visible chat messages
repeat(chat_size) {
	ds_list_add(global.chat,"");
	ds_list_add(global.chat_color, ds_map_find_value(con_client.color_map, colors.black));
}

chat_text = "";		// Current chat message
/// @description Set up the chat
// I turned this off since we're not working on chat, and this is just causing grief
global.chat = ds_list_create();
global.chat_color = ds_list_create();

var chat_icon;
chat_icon = instance_create_layer(0, 0, "Instances", obj_chat_icon);

show_chat = false;

active = false;		// Turn chat on/off. Default to false.

chat_size = 10;		// # of visible chat messages
repeat(chat_size) {
	ds_list_add(global.chat,"");
	ds_list_add(global.chat_color, ds_map_find_value(con_client.color_map, colors.fuchsia));
}

chat_text = "";		// Current chat message
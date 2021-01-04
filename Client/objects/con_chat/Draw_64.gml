/// @description Show chat
// I turned this off since we're not working on chat, and this is just causing grief

if (show_chat){
	
	show_debug_message(chat_text);

	draw_set_halign(fa_left);
	draw_set_valign(fa_middle);
	
	draw_set_color(c_white);
	draw_rectangle(30, 30, 450, 300, false);

	for (var i = 0; i < chat_size; i++) {
		draw_set_color(ds_list_find_value(global.chat_color, i));
		draw_text(100, 130-(16*i), ds_list_find_value(global.chat, i));
	}

	if (active) {
		draw_set_color(c_lime);
		draw_text(100, 400, "> " + chat_text);
	} else {
		draw_set_color(c_gray);
		draw_text(100, 400, "> ");
	}
}
/// @description Show chat

if (show_chat){
	
	//show_debug_message(chat_text);

	draw_set_halign(fa_left);
	draw_set_valign(fa_middle);
	
	draw_set_font(Font2);
	
	draw_set_color(c_white);
	draw_rectangle(80, 30, 450, 250, false);

	for (var i = 0; i < chat_size; i++) {
		draw_set_color(ds_list_find_value(global.chat_color, i));
		draw_text(100, 209-(16*i), ds_list_find_value(global.chat, i));
	}

	draw_set_color(c_gray);
	draw_text(100, 225, "> " + chat_text);

	draw_set_font(Font1);
}
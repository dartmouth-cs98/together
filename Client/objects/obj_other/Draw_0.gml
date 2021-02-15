/// @description Draw self and display username

// Draws a segment of the sprite sheet based on data model
draw_sprite_part(
	sprite_sheet,
	0,
	left_gap + (floor(x_frame) * (frame_width + h_sep)),	// Left
	top_gap + (y_frame * (frame_height + v_sep))-7,			// Top
	frame_width,
	frame_height+7,
	x - x_offset,
	y - y_offset);

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);

if (obj_player.scrambled == 0){
	draw_text(x, y-40, username);
}
else if (obj_player.scrambled == 1){ // Clone certain letters
	
	new_username = "";
	
	for (i = 0; i < string_length(username); i++){
		
		if (string_char_at(username, i) == "s"){
			new_username = string_insert("ss", new_username, string_length(new_username) + 1);
		}
		else if (string_char_at(username, i) == "l"){
			new_username = string_insert("ll", new_username, string_length(new_username) + 1);
		}
		else if (string_char_at(username, i) == "t"){
			new_username = string_insert("tt", new_username, string_length(new_username) + 1);
		}
		else if (string_char_at(username, i) == "r"){	
			new_username = string_insert("rr", new_username, string_length(new_username) + 1);
		}
		else{
			new_username = string_insert(string_char_at(username, i), new_username, string_length(new_username) + 1);
		}
		//show_debug_message(new_username);
	}
	
	draw_text(x, y-40, new_username);
}
else if (obj_player.scrambled == 2){ // Cut off name after five characters
	
	new_username = string_copy(username, 0, 5);
	draw_text(x, y-40, new_username);
}
/// @description Control character select

if		(keyboard_check_pressed(global.key_right))	{ column++; }
else if (keyboard_check_pressed(global.key_left))	{ column--; }
else if (keyboard_check_pressed(global.key_down))	{ row++; }
else if (keyboard_check_pressed(global.key_up))		{ row--; }

column = clamp(column, 0, num_columns-1);
row = clamp(row, 0, num_rows-1);

// Store relevant sprite info in con_game_manager, to be transferred to obj_player
if (keyboard_check_pressed(global.key_enter)) {
	con_game_manager.player_sprite = sprite_grid[# column, row];
	con_game_manager.player_sprite_w = sprite_get_width(icon_grid[# column, row]);
	con_game_manager.player_sprite_h = sprite_get_height(icon_grid[# column, row]);
	/*
	show_debug_message("Sprite selected");
	show_debug_message("R: " + string(row) );
	show_debug_message("C: " + string(column) );
	show_debug_message("W: " + string(con_game_manager.player_sprite_w));
	show_debug_message("H: " + string(con_game_manager.player_sprite_h));
	*/
	room_goto(rm_client);
}
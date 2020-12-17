/// @description Control character select

if		(keyboard_check_pressed(global.key_right))	{ column++;		audio_play_sound(menu_sound, 1, false); }
else if (keyboard_check_pressed(global.key_left))	{ column--;		audio_play_sound(menu_sound, 1, false); }
else if (keyboard_check_pressed(global.key_down))	{ row++;		audio_play_sound(menu_sound, 1, false); }
else if (keyboard_check_pressed(global.key_up))		{ row--;		audio_play_sound(menu_sound, 1, false); }

column = clamp(column, 0, num_columns-1);
row = clamp(row, 0, num_rows-1);

// Store relevant sprite info in con_game_manager, to be transferred to obj_player
if (keyboard_check_pressed(global.key_enter)) {
	audio_play_sound(menu_sound, 1, false);
	con_game_manager.player_sprite = sprite_grid[# column, row];
	con_game_manager.player_sprite_w = sprite_get_width(icon_grid[# column, row]);
	con_game_manager.player_sprite_h = sprite_get_height(icon_grid[# column, row]);
	room_goto(rm_client);
}
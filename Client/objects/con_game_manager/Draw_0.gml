/// @description Draw text depending on room & functionality

#region main menu
if (room == rm_main_menu) {
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text(room_width/2, room_height/2, "Press Space to be a Gamer(tm)")
}
#endregion

#region pause menu
if (paused) {
	// Redraw player from stored data
	draw_sprite_ext(player_data[0], player_data[1], player_data[2],
					player_data[3], player_data[4], player_data[5],
					player_data[6], player_data[7], player_data[8]/2);
	
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_color(c_white);
	draw_text(global.cam_X + (global.cam_height/2), global.cam_Y + (global.cam_height/2), "Paused")
}
#endregion
/// @description Draw text depending on room & functionality

#region main menu
if (room == rm_main_menu) {
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text(room_width/2, room_height/2, "Press Space to be a Gamer(tm)")
}
#endregion

/*
#region Pause message
if (global.paused) {
	// Draw pause message
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_color(c_white);
	draw_text(global.cam_X + (global.cam_height/2), global.cam_Y + (global.cam_height/2), "Paused")
}
#endregion
*/
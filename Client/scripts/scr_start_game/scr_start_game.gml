///@description Begin the game from the main menu by transferring to the sprite select
function scr_start_game(){
	//room_goto(rm_sprite_select);
	room_goto(rm_wait);
	window_set_size(1366,768);
	surface_resize(application_surface,1366,768);
	display_set_gui_size(1366,768);
}
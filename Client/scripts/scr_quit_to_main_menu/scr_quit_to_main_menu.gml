///@description Return player to the main menu.
function scr_quit_to_main_menu(){
	scr_unpause();
	global.pause_menu = false;
	global.any_menu = false;
	with (con_client) {
		network_destroy(client);
	}
	room_instance_clear(rm_client);
	audio_stop_sound(msc_MusicDUNGEON);
	room_goto(rm_main_menu);
}
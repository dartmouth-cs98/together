///@description Return player to the main menu.
function scr_quit_to_main_menu(){
	audio_stop_sound(msc_MusicDUNGEON);
	room_goto(rm_main_menu);
}
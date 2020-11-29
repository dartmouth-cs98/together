///@description Close the pause menu
function scr_resume_game(){
	scr_unpause();
	global.pause_menu = false;
	global.any_menu = false;
}
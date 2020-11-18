/// @description Open pause menu

if (room == rm_client) {
	if (!global.paused) {
		scr_pause();
		global.pause_menu = true;
	} else {
		scr_unpause();
		global.pause_menu = false;
		with (con_menu) {
			page = 0;
		}
	}
}
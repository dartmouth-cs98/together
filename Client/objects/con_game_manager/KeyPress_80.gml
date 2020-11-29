/// @description Open pause menu

if ( !(global.any_menu and !global.pause_menu) ) {
	if (room == rm_client) {
		if (!global.paused) {
			scr_pause();
			global.pause_menu = true;
			global.any_menu = true;
		} else {
			scr_unpause();
			global.pause_menu = false;
			global.any_menu = false;
			with (con_menu) {
				page = 0;
			}
		}
	}	
}
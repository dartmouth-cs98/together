/// @description Open pause menu

if (room == rm_client) {
	if (!global.paused) {
		scr_pause();
	} else {
		scr_unpause();
	}
}
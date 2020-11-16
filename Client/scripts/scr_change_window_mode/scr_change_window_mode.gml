/// @description Swap between fullscreen & windowed mode
function scr_change_window_mode(window_mode){
	switch (window_mode) {
		case 0: window_set_fullscreen(true); break;
		case 1: window_set_fullscreen(false); break;
	}
}
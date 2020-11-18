///@description Change resolution to preset values based on input index. Don't change it in fullscreen
function scr_change_resolution(index){
	if (!window_get_fullscreen()) {
		switch (index) {
			case 0: window_set_size(384, 216); break;
			case 1: window_set_size(768, 432); break;
			case 2: window_set_size(1152, 648); break;
			case 3: window_set_size(1536, 874); break;
			case 4: window_set_size(1920, 1080); break;
		}
	}
}
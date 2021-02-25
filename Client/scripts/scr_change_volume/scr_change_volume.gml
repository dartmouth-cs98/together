///@description Takes value to set the volume to and which volume type to change
function scr_change_volume(value, type){
	switch (type) {
		// Master volume
		case 0: audio_master_gain(value); global.master_volume = value; break;
		
		// Sound effect volume
		case 1: audio_group_set_gain(audiogroup_soundeffects, value, 0); global.sound_volume = value; break;
		
		// Music volume
		case 2: audio_group_set_gain(audiogroup_music, value, 0); global.music_volume = value; break;
	}
}
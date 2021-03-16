/// @description Store player in rm_client

switch (room) {
	case rm_client:
		global.player = instance_find(obj_player, 0);
		audio_stop_all();
		audio_play_sound(msc_MusicDUNGEON, 2, true);
		window_set_size(1152, 648);
		other_count = 0;
		id_to_npc_object_map = ds_map_create();
		break;
		
	case rm_win_screen:
		audio_stop_all();
		audio_play_sound(msc_MusicADVENTURE, 2, false);
		break;
		
	default:
		break;
}
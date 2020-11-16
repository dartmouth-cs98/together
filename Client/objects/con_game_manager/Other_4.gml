/// @description Store player in rm_client

if (room = rm_client) {
	global.player = instance_find(obj_player, 0);
	audio_play_sound(msc_MusicDUNGEON, 2, true);
}
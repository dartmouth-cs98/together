/// @description Set up menus
// You can write your code in this editor

username = get_string("Please enter a username", "");

global.taskbar = 0;

// Keep track of game state when pausing
global.paused = false;

// Is there any menu open?
global.any_menu = false;

// Variables for which menu to open
global.pause_menu = false;
global.minigame_passcode = false;

audio_group_load(audiogroup_music);
audio_group_load(audiogroup_soundeffects);
audio_group_load(audiogroup_master);

// Set default volume ot 50%
//script_execute(scr_change_volume, 0.5, 0);

with (con_menu) {
	script_execute(ds_grid[# 2, menu_option[page]], ds_grid[# 3, menu_option[page]], menu_option[page]);	
}
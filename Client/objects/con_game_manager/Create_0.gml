/// @description Set up game
// You can write your code in this editor

username = get_string_async("Please enter a username", "");

// Used so we can pass it on to the game.
player_sprite = 0;
player_sprite_h = 0;
player_sprite_w = 0;

// Default controls
global.key_enter	= vk_space;		// Confirm
global.key_left		= vk_left;
global.key_right	= vk_right;
global.key_up		= vk_up;
global.key_down		= vk_down;

// Taskbar
global.taskbar = 0;
global.taskbar_max = 100;

// Keep track of game state when pausing
global.paused = false;

// Is there any menu open?
global.any_menu = false;

// Variables for which menu to open
global.pause_menu = false;
global.inventory_menu = false;
global.minigame_passcode = false;
global.minigame_duotask = false;

audio_group_load(audiogroup_music);
audio_group_load(audiogroup_soundeffects);
audio_group_load(audiogroup_master);

with (con_menu) {
	script_execute(ds_grid[# 2, menu_option[page]], ds_grid[# 3, menu_option[page]], menu_option[page]);	
}

other_count = 0;

randomize();
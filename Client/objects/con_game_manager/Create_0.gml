/// @description Set up game
// You can write your code in this editor

username = get_string_async("Please enter a username", "");

// Used so we can pass it on to the game.
player_sprite = 0;
player_sprite_h = 0;
player_sprite_w = 0;

//// ENUMS USED FOR MENU PAGES
// ID for each menu page
enum menu_page {
	main,
	settings,
	audio,
	//difficulty,
	graphics,
	controls,
	main_or_exit,
	height,			// Used to check how many entries are in this enum
}

// ID for each type of menu element
enum menu_element_type {
	script_runner,
	page_transfer,
	slider,
	shift,
	toggle,
	input,
	height,			// Used to check how many entries are in this enum
}

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
global.minigame_passcode = false;
global.minigame_duotask = false;

// Variables to control the camera
global.cam_X = 0;
global.cam_Y = 0;

global.cam_width = 544;
global.cam_height = 306;

audio_group_load(audiogroup_music);
audio_group_load(audiogroup_soundeffects);
audio_group_load(audiogroup_master);

with (con_pause_menu) {
	script_execute(ds_grid[# 2, menu_option[page]], ds_grid[# 3, menu_option[page]], menu_option[page]);	
}

id_to_npc_object_map = ds_map_create();
other_count = 0;

/*
role_to_sprite_map = ds_map_create();
ds_map_add(role_to_sprite_map, "Doctor", spr_doctor);
ds_map_add(role_to_sprite_map, "Farmer", spr_farmer);
ds_map_add(role_to_sprite_map, "Post Officer", spr_mail_carrier);
ds_map_add(role_to_sprite_map, "Taxi Driver", spr_taxi_driver);
ds_map_add(role_to_sprite_map, "Shopkeeper", spr_shopkeeper);
ds_map_add(role_to_sprite_map, "Jack of All Trades", spr_jack_of_all_trades);
ds_map_add(role_to_sprite_map, "Mayor", spr_mayor);
ds_map_add(role_to_sprite_map, "Philanthropist", spr_philanthropist);
ds_map_add(role_to_sprite_map, "Engineer", spr_engineer);
ds_map_add(role_to_sprite_map, "Scientist", spr_scientist);

role_to_ability_icon_map = ds_map_create();
ds_map_add(role_to_sprite_map, "Doctor", spr_doctor_ability);
ds_map_add(role_to_sprite_map, "Farmer", spr_farmer_ability);
ds_map_add(role_to_sprite_map, "Post Officer", spr_post_officer_ability);
ds_map_add(role_to_sprite_map, "Taxi Driver", spr_taxi_driver_ability);
ds_map_add(role_to_sprite_map, "Shopkeeper", spr_shopkeeper_ability);
ds_map_add(role_to_sprite_map, "Jack of All Trades", spr_jack_of_all_trades_ability);
ds_map_add(role_to_sprite_map, "Mayor", spr_mayor_ability);
ds_map_add(role_to_sprite_map, "Philanthropist", spr_philanthropist_ability);
ds_map_add(role_to_sprite_map, "Engineer", spr_engineer_ability);
ds_map_add(role_to_sprite_map, "Scientist", spr_scientist_ability);
*/

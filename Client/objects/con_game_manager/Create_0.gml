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

id_to_npc_object_map = ds_map_create();
other_count = 0;

npc_infection_level = 0;

#region roles and tasks

role_to_tasks_map = ds_map_create();
doctor_tasks = ds_list_create();
scientist_tasks = ds_list_create();
farmer_tasks = ds_list_create();
shopkeeper_tasks = ds_list_create();
engineer_tasks = ds_list_create();
mail_carrier_tasks = ds_list_create();
mayor_tasks = ds_list_create();

ds_list_add(doctor_tasks, "Save 5 NPCs");
ds_list_add(doctor_tasks, "Collect Apples");
ds_list_add(scientist_tasks, "Graph Disease Progression");
ds_list_add(scientist_tasks, "Collect Apples");
ds_list_add(farmer_tasks, "Collect Apples");
ds_list_add(farmer_tasks, "Duotask Unnamed");
ds_list_add(shopkeeper_tasks, "Collect Apples");
ds_list_add(shopkeeper_tasks, "Duotask Unnamed");
ds_list_add(engineer_tasks, "Collect Apples");
ds_list_add(mail_carrier_tasks, "Collect Apples");
ds_list_add(mayor_tasks, "Collect Apples");
ds_list_add(mayor_tasks, "Enter Passcode");

ds_map_add(role_to_tasks_map, "Doctor", doctor_tasks);
ds_map_add(role_to_tasks_map, "Scientist", scientist_tasks);
ds_map_add(role_to_tasks_map, "Engineer", scientist_tasks);
ds_map_add(role_to_tasks_map, "Farmer", scientist_tasks);
ds_map_add(role_to_tasks_map, "Mail Carrier", scientist_tasks);
ds_map_add(role_to_tasks_map, "Mayor", scientist_tasks);
ds_map_add(role_to_tasks_map, "Shopkeeper", scientist_tasks);

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
#endregion

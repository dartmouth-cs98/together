/// @description Set up menus elements

// Menus are based on tutorial from FriendlyCosmonaut: https://youtu.be/Y0XohkeieVg

//									CREATE MENU PAGES
//	----------		------------------------------		--------------		--------------
//	|Elt text|		|		   Elt type          |		|Elt function|		|Other params|
//	----------		------------------------------		--------------		--------------

ds_menu_main = scr_create_menu_page(
	["START",		menu_element_type.script_runner,	scr_start_game],		// TODO: New script needed
	["SETTINGS",	menu_element_type.page_transfer,	menu_page.settings],
	["EXIT",		menu_element_type.script_runner,	scr_exit_game],
	[],
	[]
);

ds_menu_settings = scr_create_menu_page(
	["AUDIO",		menu_element_type.page_transfer,	menu_page.audio],
	/*["DIFFICULTY",	menu_element_type.page_transfer,	menu_page.difficulty],*/
	["GRAPHICS",	menu_element_type.page_transfer,	menu_page.graphics],
	["CONTROLS",	menu_element_type.page_transfer,	menu_page.controls],
	["BACK",		menu_element_type.page_transfer,	menu_page.main],
	[]
);

ds_menu_audio = scr_create_menu_page(	
	["MASTER",		menu_element_type.slider,			scr_change_volume,	0.5,	[0,1]],
	["SOUNDS",		menu_element_type.slider,			scr_change_volume,	0.5,	[0,1]],
	["MUSIC",		menu_element_type.slider,			scr_change_volume,	0.5,	[0,1]],
	["BACK",		menu_element_type.page_transfer,	menu_page.settings],
	[]
);
/*
ds_menu_difficulty = scr_create_menu_page(
	["ENEMIES",		menu_element_type.shift,			scr_change_difficulty,	0,	["HARMLESS", "NORMAL", "DANGEROUS"]],
	["ALLIES",		menu_element_type.shift,			scr_change_difficulty,	0,	["UNHELPFUL", "NORMAL", "HELPFUL"]],
	["BACK",		menu_element_type.page_transfer,	menu_page.settings],
	[],
	[]
);
*/
ds_menu_graphics = scr_create_menu_page(
	["RESOLUTION",	menu_element_type.shift,			scr_change_resolution,	2,	["384 x 216", "768 x 432", "1152 x 648", "1536 x 874", "1920 x 1080"]],
	["FULLSCREEN",	menu_element_type.toggle,			scr_change_window_mode,	1,	["ON", "OFF"]],
	["BACK",		menu_element_type.page_transfer,	menu_page.settings],
	[],
	[]
);

ds_menu_controls = scr_create_menu_page(
	["UP",			menu_element_type.input,			"key_up",		vk_up],
	["LEFT",		menu_element_type.input,			"key_left",		vk_left],
	["RIGHT",		menu_element_type.input,			"key_right",	vk_right],
	["DOWN",		menu_element_type.input,			"key_down",		vk_down],
	["BACK",		menu_element_type.page_transfer,	menu_page.settings]
);

page = 0;			// Current page, index in menu_pages
menu_pages = [ds_menu_main, ds_menu_settings, ds_menu_audio, /*ds_menu_difficulty,*/ ds_menu_graphics, ds_menu_controls];


var i = 0;
menu_option = [];	// What option we're on in a given page

var i = 0;
repeat(array_length_1d(menu_pages)) {
	menu_option[i] = 0;
	i++;
}

inputting = false;	// Are we currently setting some value in a menu?
/// @description Manage selection of menu elements

if (global.paused and global.pause_menu) {
	input_up_p		= keyboard_check_pressed(global.key_up);
	input_down_p	= keyboard_check_pressed(global.key_down);
	input_enter_p	= keyboard_check_pressed(global.key_enter);
	
	var ds_grid = menu_pages[page];
	var ds_height = ds_grid_height(ds_grid);
	
	#region Accept input or navigate menu
	if (inputting) {
		switch(ds_grid[# 1, menu_option[page]]) {
			case menu_element_type.shift:
				#region shift
				
				var h_input = keyboard_check_pressed(global.key_right) - keyboard_check_pressed(global.key_left);
				if (h_input != 0) {
					ds_grid[# 3, menu_option[page]] += h_input;
					ds_grid[# 3, menu_option[page]] = clamp(ds_grid[# 3, menu_option[page]], 0, array_length_1d(ds_grid[# 4, menu_option[page]])-1);
				}
				
				#endregion
				break;
				
			case menu_element_type.slider:
				#region slider
				
				switch (menu_option[page]) {
					case 0: /*if (!audio_is_playing(snd_Land01)) { audio_play_sound(snd_Land01, 1, false); } break;*/
					case 1: if (!audio_is_playing(snd_Attack02)) { audio_play_sound(snd_Attack02, 1, false); } break;
					case 2: break;
				}
				
				var h_input = keyboard_check(global.key_right) - keyboard_check(global.key_left);
				if (h_input != 0) {
					ds_grid[# 3, menu_option[page]] += h_input * 0.01;
					ds_grid[# 3, menu_option[page]] = clamp(ds_grid[# 3, menu_option[page]], 0, 1);
					// Change the relevant value as the slider moves
					if (inputting) { script_execute(ds_grid[# 2, menu_option[page]], ds_grid[# 3, menu_option[page]], menu_option[page]); }
				}
				
				#endregion
				break;
				
			case menu_element_type.toggle:
				#region toggle
				
				var h_input = keyboard_check_pressed(global.key_right) - keyboard_check_pressed(global.key_left);
				if (h_input != 0) {
					ds_grid[# 3, menu_option[page]] += h_input;
					ds_grid[# 3, menu_option[page]] = clamp(ds_grid[# 3, menu_option[page]], 0, 1);
				}
				
				#endregion
				break;
				
			case menu_element_type.input:
				#region input
				
				var last_key = keyboard_lastkey;
				if (last_key != vk_enter) {
					ds_grid[# 3, menu_option[page]] = last_key;
					variable_global_set(ds_grid[# 2, menu_option[page]], last_key);
				}
				
				#endregion
				break;
		}
	} else {
		// Navigate menu
		var option_change = input_down_p - input_up_p;
		if (option_change != 0) {
			menu_option[page] += option_change;
			
			if (menu_option[page] > ds_height-1) { menu_option[page] = 0; }
			if (menu_option[page] < 0) { menu_option[page] = ds_height - 1; }	
		}
	}
	#endregion
	
	#region Enact selected option
	if (input_enter_p) {
		switch(ds_grid[# 1, menu_option[page]]) {
			case menu_element_type.script_runner: script_execute(ds_grid[# 2, menu_option[page]]); break;
			case menu_element_type.page_transfer: page = ds_grid[# 2, menu_option[page]]; break;
			case menu_element_type.shift:
			case menu_element_type.slider:
			case menu_element_type.toggle: if (inputting) { script_execute(ds_grid[# 2, menu_option[page]], ds_grid[# 3, menu_option[page]]); }
			case menu_element_type.input:
				// The switch case is structured like this so that they will all flip the value of "inputting"
				inputting = !inputting;
				break;
		}
	}
	#endregion
}
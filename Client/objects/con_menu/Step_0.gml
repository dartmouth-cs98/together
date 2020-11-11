/// @description Manage selection of menu elements

if (global.paused) {
	input_up_p		= keyboard_check_pressed(global.key_up);
	input_down_p	= keyboard_check_pressed(global.key_down);
	input_enter_p	= keyboard_check_pressed(global.key_enter);
	
	var ds_grid = menu_pages[page];
	var ds_height = ds_grid_height(ds_grid);
	
	#region Navigate menu
	var option_change = input_down_p - input_up_p;
	if (option_change != 0) {
		menu_option[page] += option_change;
		
		if (menu_option[page] > ds_height-1) { menu_option[page] = 0; }
		if (menu_option[page] < 0) { menu_option[page] = ds_height - 1; }	
	}
	#endregion
	
	#region Enact selected option
	if (input_enter_p) {
		switch(ds_grid[# 1, menu_option[page]]) {
			case menu_element_type.page_transfer:page = ds_grid[# 2, menu_option[page]]; break;
		}
	}
	#endregion
}
/// @description For key presses

if (keyboard_check_pressed(global.key_left)) {
	if (global.inventory_menu and (itemSelected == undefined)) {
		selected -= 1;
		selected = clamp(selected, 0, global.max_inventory-1);
	}
}

if (keyboard_check_pressed(global.key_right)) {
	if (global.inventory_menu and (itemSelected == undefined)) {
		selected += 1;
		selected = clamp(selected, 0, global.max_inventory-1);
	}
}

if (keyboard_check_pressed(global.key_up)) {
	if (itemSelected != undefined) {
		option -= 1;
		ds_list_size(itemSelected.optionNames);
		show_debug_message(string(ds_list_size(itemSelected.options)));
		option = clamp(option, 0, ds_list_size(itemSelected.options) -1);
	}
}

if (keyboard_check_pressed(global.key_down)) {
	if (itemSelected != undefined) {
		option += 1;
		option = clamp(option, 0, ds_list_size(itemSelected.options) -1);
	}
}

if (keyboard_check_pressed(global.key_enter)) {
	// If selecting an object command
	if (itemSelected != undefined) {
		// Run the command
		script_execute(ds_list_find_value(itemSelected.options, option));
	
		itemSelected = undefined;
		exit;
	}

	// Select item
	if (global.inventory_menu) {
		var object = ds_list_find_value(global.inventory, selected);
		if (object == undefined) {
			scr_create_text("There is no item here!");
		} else {
			scr_create_text("OBJECT SELECTED");
			itemSelected = object;
			option = 0;
		}
	}
}
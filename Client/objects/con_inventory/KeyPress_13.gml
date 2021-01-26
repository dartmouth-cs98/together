/// @description Select item

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
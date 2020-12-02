/// @description Script for picking up an object.

function scr_pickup(object){
	// Picks up object
	if(ds_list_find_index(inventory, object.object_index) < 0){
		if(ds_list_size(inventory) < max_inventory){
			ds_list_add(inventory, object.object_index);
		} else {
			show_message("You're inventory is full!");
		}
	} else {
		show_message("You already have one!");
	}
}
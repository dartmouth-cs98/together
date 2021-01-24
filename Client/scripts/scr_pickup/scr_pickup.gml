/// @description Script for picking up an object.

function scr_pickup(object){
	// Picks up object
	if(ds_list_size(global.inventory) < global.max_inventory){
		ds_list_add(global.inventory, object.object_index);
	} else {
		scr_create_text("You're inventory is full!");
	}
}
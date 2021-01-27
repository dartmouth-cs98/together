/// @description Script for picking up an object and removing it.

function scr_pickup_and_destroy(object){
	// Picks up object
	if(ds_list_size(global.inventory) < global.max_inventory){
		ds_list_add(global.inventory, object);
		object.x = -100;
		object.y = -100;
	} else {
		scr_create_text("Your inventory is full!");
	}
}
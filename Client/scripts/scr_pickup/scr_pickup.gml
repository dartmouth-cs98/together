/// @description Script for picking up an object.

function scr_pickup(object){
	// Picks up object
	// Clone object
	clone = instance_create_layer(-100, -100, "Instances", object.object_index); 
	if(ds_list_size(global.inventory) < global.max_inventory){
		ds_list_add(global.inventory, clone);
	} else {
		scr_create_text("You're inventory is full!");
	}
}
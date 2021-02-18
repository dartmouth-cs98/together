/// @description Script for picking up an object.

function scr_pickup_seeds(object){
	// Picks up object
	// Clone object
	clone = instance_create_layer(-100, -100, "Instances", object.pickup_item); 
	if(ds_list_size(global.inventory) < global.max_inventory){
		ds_list_add(global.inventory, clone);
		object.seed_packet_count++;
	} else {
		scr_create_text("Your inventory is full!");
	}
}
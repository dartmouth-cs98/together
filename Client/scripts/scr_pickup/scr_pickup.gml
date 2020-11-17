/// @description Script for picking up an object

function scr_pickup(object){
	// Picks up object
	var value = object.object_index;

	if(ds_list_find_index(inventory, value)){
		show_message("You already have one!");
	}
}
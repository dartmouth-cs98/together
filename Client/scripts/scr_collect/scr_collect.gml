/// @description Script for delivering an object.

function scr_collect(object){
	// Checks to see if object is in inventory
	var len = ds_list_size(inventory);
	for(var i = 0; i < len; i++) {
		var key = ds_list_find_value(inventory, i);
		if(object_get_name(key)==object.collects){
			ds_list_delete(inventory, i);
			scr_task_complete(10);
			show_message("Delivery successful!");
			exit;
		}
	}
	//show_message("You do not have object: " + string(object.collects) + "!");
	show_message("You don't have any apples in your inventory! See if you can find all 5.");
}
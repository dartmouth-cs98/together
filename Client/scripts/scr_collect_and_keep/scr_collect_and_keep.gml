/// @description Script for delivering an object.

function scr_collect_and_keep(object){
	// Checks to see if object is in inventory
	var len = ds_list_size(global.inventory);
	for(var i = 0; i < len; i++) {
		var key = ds_list_find_value(global.inventory, i);
		if(object_get_name(key.object_index)==object.collects){
			scr_task_complete(object.taskvalue);
			scr_create_text("Success!");
			instance_destroy(object);
			exit;
		}
	}
	scr_create_text(object.empty_message);
}
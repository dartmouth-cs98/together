// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_cooking(){
	// Check inventory for ingredients
	var len = ds_list_size(global.inventory);
	for(var i = 0; i < len; i++) {
		var item = ds_list_find_value(global.inventory, i);
		
		if (item.task == "Cooking") {
			scr_create_text("Drop ingredients on oven to cook!")
			exit;
		}
	}
	scr_create_text("You don't have any cookable ingredients in your inventory!")
}
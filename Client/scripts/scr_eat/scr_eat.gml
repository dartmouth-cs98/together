// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_eat(){
	// Remove item from inventory
	ds_list_delete(global.inventory, selected);
	
	obj_player.food += 1;
	obj_player.food = min(obj_player.food, obj_player.food_max);
	
	instance_destroy(itemSelected);
	
	itemSelected = undefined;
}
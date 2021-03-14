// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_server_drop(){
	// Remove item from inventory
	ds_list_delete(global.inventory , selected);
	
	itemSelected.x = obj_player.x;
	itemSelected.y = obj_player.y;
	
	scr_create_text("Item dropped");
	itemSelected = undefined;
}
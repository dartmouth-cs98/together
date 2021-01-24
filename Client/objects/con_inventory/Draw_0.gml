/// @description Draw inventory

if (!global.paused) {
	inventory_x = global.cam_X + (global.cam_width/2)-75; // int
	inventory_y = global.cam_Y + global.cam_height-48; // int
	
	draw_sprite(spr_inventory, 0, inventory_x, inventory_y);
	
	var len = ds_list_size(global.inventory);
	for(var i = 0; i < len; i++) {
		var key = ds_list_find_value(global.inventory, i);
		draw_sprite(object_get_sprite(key), 0, inventory_x+25+(50*i), inventory_y+26);
	}
}
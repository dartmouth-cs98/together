/// @description Draw taskbar

draw_sprite(spr_taskbar_border, 0, taskbar_x, taskbar_y);
draw_sprite_stretched(spr_taskbar, 0, taskbar_x, taskbar_y, (global.taskbar/taskbar_max) * taskbar_width, taskbar_height);

if(showInventory){
	draw_sprite(spr_inventory, 0, inventory_x, inventory_y);
	
	var len = ds_list_size(inventory);
	for(var i = 0; i < len; i++) {
		var key = ds_list_find_value(inventory, i);
		draw_sprite(object_get_sprite(key), 0, inventory_x+25+(50*i), inventory_y+26);
	}
} else {
	draw_sprite(spr_tab, 0, inventory_x, inventory_y);
}
/// @description Draw inventory

if (!global.paused or global.inventory_menu) {
	inventory_x = global.cam_X + (global.cam_width/2)-75; // int
	inventory_y = global.cam_Y + global.cam_height-48; // int
	
	draw_sprite(spr_inventory, 0, inventory_x, inventory_y);
	
	// Draw items
	var len = ds_list_size(global.inventory);
	for(var i = 0; i < len; i++) {
		var key = ds_list_find_value(global.inventory, i);
		draw_sprite(object_get_sprite(key.object_index), 0, inventory_x+25+(50*i), inventory_y+26);
	}
	
	// Draw selector
	if (global.inventory_menu) {
		draw_sprite(spr_selector, 0, inventory_x+25+(50*selected), inventory_y - 10);
	}
	
	// Draw item options
	if (itemSelected != undefined) {
		for (i=0; i < ds_list_size(itemSelected.optionNames); i++) {
			
			if (option == i) {
				draw_set_color(_color);
			} else {
				draw_set_color(_hover_color);
			}

			draw_roundrect(inventory_x+(50*selected), inventory_y-25-(i*_offset), inventory_x+(50*selected)+_width, inventory_y-25-(i*_offset)+_height, 0);	// Rounded rectangle

			draw_set_color(_text_color);
			draw_set_halign(fa_center);
			draw_set_valign(fa_middle);
			draw_text(inventory_x+(50*selected) + _width/2, inventory_y-25-(i*_offset) + _height/2, ds_list_find_value(itemSelected.optionNames, ds_list_size(itemSelected.optionNames)-1-i));
		}
		
	}
}
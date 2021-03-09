/// @description For drawing text after
if (room != rm_client) {
	exit;
}

if (global.inventory_menu or not global.paused) {
	inventory_x = global.cam_X + (global.cam_width/2)-75; // int
	inventory_y = global.cam_Y + global.cam_height-48; // int
	
	// Draw item options
	if (itemSelected != undefined) {
		for (i=0; i < ds_list_size(itemSelected.optionNames); i++) {
			draw_set_color(_text_color);
			draw_set_halign(fa_center);
			draw_set_valign(fa_middle);
			draw_text(inventory_x+(50*selected) + _width/2, inventory_y-25-(i*_offset) + _height/2, ds_list_find_value(itemSelected.optionNames, ds_list_size(itemSelected.optionNames)-1-i));
		}
	}
}
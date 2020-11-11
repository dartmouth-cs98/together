/// @description Draw menus

if (global.paused) {	
	#region Variables for readability
	var ds_grid = menu_pages[page];
	var ds_height = ds_grid_height(ds_grid);
	var y_buffer = 32;
	var x_buffer = 16;
	var start_y = (global.cam_height/2) - ((((ds_height-1)/2) * y_buffer));
	var start_x = global.cam_width/2;
	#endregion
	
	#region Draw background
	var c = c_black;
	draw_rectangle_color(0, 0, global.cam_width, global.cam_height, c, c, c, c, false);
	#endregion
	
	#region Draw left side elements
	draw_set_valign(fa_middle);
	draw_set_halign(fa_right);
	
	var ltx = start_x - x_buffer;	// ltx = left text x-position. 3 guesses what lty is...
	var lty;
	var x_offset;
	
	for (var yy = 0; yy < ds_height; yy++) {
		lty = start_y + (yy * y_buffer);
		
		if (yy == menu_option[page]) {
			c = c_orange;
			x_offset = -(x_buffer/2);
		} else {
			c = c_white;
			x_offset = 0;
		}
		
		draw_text_color(ltx + x_offset, lty, ds_grid[# 0, yy], c, c, c, c, 1);
	}
	#endregion
	
	#region Draw dividing line
	draw_line(start_x, start_y - y_buffer, start_x, lty + y_buffer);
	#endregion
	
	#region Draw right side elements
	draw_set_halign(fa_left);
	
	// This is basically the same as ltx
	var rtx = start_x + x_buffer;
	var rty;
	
	for (yy = 0; yy < ds_height; yy++) {
		rty = start_y + (yy * y_buffer);
		
		switch(ds_grid[# 1, yy]) {
			case menu_element_type.shift:
				#region shift
				var current_value = ds_grid[# 3, yy];
				var current_array = ds_grid[# 4, yy];
				var left_shift = "<< ";
				var right_shift = " >>";
				
				if (current_value == 0) { left_shift = ""; }
				if (current_value = array_length_1d(ds_grid[# 4, yy])-1) { right_shift = ""; }
				
				c = c_white;
				draw_text_color(rtx, rty, left_shift+current_array[current_value]+right_shift, c, c, c, c, 1);
				#endregion
				break;
				
			case menu_element_type.slider:
				#region slider
				var len = 64;
				var current_value = ds_grid[# 3, yy];
				var current_array = ds_grid[# 4, yy];
				var circle_pos = ((current_value - current_array[0]) / (current_array[1] - current_array[0]));
				c = c_white;
				
				draw_line_width(rtx, rty, rtx+len, rty, 2)
				draw_circle_color(rtx);
				#endregion
				break;
		}
	}
	#endregion
	
	draw_set_valign(fa_middle);
}
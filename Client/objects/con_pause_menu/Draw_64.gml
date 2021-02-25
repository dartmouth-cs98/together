/// @description Draw menus

if (global.paused and global.pause_menu) {	
	#region Variables for readability & prevention of magic numbers
	
	var ds_grid = menu_pages[page];
	var ds_height = ds_grid_height(ds_grid);
	
	var y_buffer = 32;
	var x_buffer = 16;
	
	var start_y = (global.cam_height/2) - ((((ds_height-1)/2) * y_buffer));
	var start_x = global.cam_width/2;
	
	var default_color = c_white;
	var selected_color = c_orange;
	var not_selected_color = c_dkgray;
	var inputting_color = c_yellow;
	
	#endregion
	
	// Draw background
	var c = c_black;
	draw_rectangle_color(0, 0, global.cam_width, global.cam_height, c, c, c, c, false);
	
	#region Draw left side elements
	draw_set_valign(fa_middle);
	draw_set_halign(fa_right);
	draw_set_font(-1); // -1 is the value of 12 point Arial font
	
	var ltx = start_x - x_buffer;	// ltx = left text x-position. 3 guesses what lty is...
	var lty;
	var x_offset;
	
	for (var yy = 0; yy < ds_height; yy++) {
		lty = start_y + (yy * y_buffer);
		
		if (yy == menu_option[page]) {
			c = selected_color;
			x_offset = -(x_buffer/2);
		} else {
			c = default_color;
			x_offset = 0;
		}
		
		draw_text_color(ltx + x_offset, lty, ds_grid[# 0, yy], c, c, c, c, 1);
	}
	#endregion
	
	// Draw dividing line
	draw_line(start_x, start_y - y_buffer, start_x, lty + y_buffer);
	
	#region Draw right side elements
	draw_set_halign(fa_left);
	
	// This is basically the same as ltx
	var rtx = start_x + x_buffer;
	var rty;
	
	for (yy = 0; yy < ds_height; yy++) {
		rty = start_y + (yy * y_buffer);
		
		// Draw the relevvant menu items based on the type in the grid.
		switch(ds_grid[# 1, yy]) {
			case menu_element_type.shift:
				#region shift
				var current_value = ds_grid[# 3, yy];
				var current_array = ds_grid[# 4, yy];
				var left_shift = "<< ";
				var right_shift = " >>";
				
				if (current_value == 0) { left_shift = ""; }
				if (current_value = array_length_1d(ds_grid[# 4, yy])-1) { right_shift = ""; }
				
				c = default_color;
				
				if (inputting and yy == menu_option[page]) { c = inputting_color; }	// Highlight if we're inputting
				
				// If we're in fullscreen, the resolution cannot be changed. Set it to gray.
				if (window_get_fullscreen()) {
					c = not_selected_color;
				}
				
				draw_text_color(rtx, rty, left_shift+current_array[current_value]+right_shift, c, c, c, c, 1);
				#endregion
				break;
				
			case menu_element_type.slider:
				#region slider
				var len = 64;
				var current_value = ds_grid[# 3, yy];
				var current_array = ds_grid[# 4, yy];
				var circle_pos = ((current_value - current_array[0]) / (current_array[1] - current_array[0]));
				c = default_color;
				
				draw_line_width(rtx, rty, rtx+len, rty, 2)
				
				if (inputting and yy == menu_option[page]) { c = inputting_color; }	// Highlight if we're inputting
				
				draw_circle_color(rtx + (circle_pos * len), rty, 4, c, c, false);
				draw_text_color(rtx + (len * 1.2), rty, string(floor(circle_pos * 100)) + "%",  c, c, c, c, 1);
				#endregion
				break;
				
			case menu_element_type.toggle:
				#region toggle
				var current_value = ds_grid[# 3, yy];
				var c1;
				var c2;
				c = default_color;
				
				if (inputting and yy == menu_option[page]) { c = inputting_color; }	// Highlight if we're inputting
				if (current_value == 0) { c1 = c; c2 = not_selected_color;}			// ON is selected
				else { c1 = not_selected_color; c2 = c;}							// OFF is selected
				
				draw_text_color(rtx, rty, ds_grid[# 4, 1][0],  c1, c1, c1, c1, 1);
				draw_text_color(rtx + 32, rty, ds_grid[# 4, 1][1],  c2, c2, c2, c2, 1);
				#endregion
				break;
				
			case menu_element_type.input:
				#region input
				var current_value = ds_grid[# 3, yy];
				var string_value;
				
				switch (current_value) {
					case vk_up:			string_value = "UP KEY"; break;
					case vk_down:		string_value = "DOWN KEY"; break;
					case vk_left:		string_value = "LEFT KEY"; break;
					case vk_right:		string_value = "RIGHT KEY"; break;
					default:			string_value = chr(current_value); break;
				}
				
				c = default_color;
				if (inputting and yy == menu_option[page]) { c = inputting_color; }
				draw_text_color(rtx, rty, string_value, c, c, c, c, 1);
				#endregion
				break;
		}
	}
	#endregion
	
	draw_set_valign(fa_middle);
}
/// @description Draw sprite select UI

draw_set_halign(fa_center);
draw_set_color(c_white);
draw_text_transformed(room_width/2, 50, "  Character Select ", 5, 5, 0);
draw_set_halign(fa_left);

// Space between sprites
var h_spacing = 160;
var v_spacing = 130;

// Gap between top of screen & sprite grid
var top_gap = 110;

for (var c = 0; c < num_columns; c++) {
	for (var r = 0; r < num_rows; r++) {
		
		var icon		= icon_grid[# c, r];
		var icon_x		= (room_width/2) + (h_spacing*(c-2));
		var icon_y		= top_gap + v_spacing*r;
		var icon_w		= sprite_get_width(icon) * 2;
		var icon_h		= sprite_get_height(icon) * 2;
		
		// Outline currently selected sprite
		if (row == r and column == c) {
			var color = c_yellow;
			draw_rectangle_color(	icon_x - 1,
									icon_y - 1,
									icon_x + icon_w + 1,
									icon_y + icon_h + 1,
									color, color, color, color, 
									true
								);
		}
		
		draw_sprite_stretched(	icon,
								0,
								icon_x,
								icon_y,
								icon_w,
								icon_h
							);
	}
}
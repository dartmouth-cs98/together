/// @description Draw sprite select UI

var width = room_width/2;
draw_set_halign(fa_center);
draw_set_color(c_green);
draw_text(width, 50, "Character Select");
draw_set_halign(fa_left);

for (var c = 0; c < num_columns; c++) {
	for (var r = 0; r < num_rows; r++) {
		draw_sprite(sprite_grid[# c, r], 0, 64+64*c, 64+64*r);
		
		if (row == r and column == c) {
			draw_set_color(c_yellow);
			draw_text(70+64*c, 124+64*r, "^");
		}
	}
}


/*
for (var i = 0; i < num_sprites; i++) {
	draw_sprite(icons[i], 0, 64+64*i, 150,);
	
	if (i == index) {
		draw_set_color(c_yellow);
		draw_text(70+64*i, 210, "^");
	}
}
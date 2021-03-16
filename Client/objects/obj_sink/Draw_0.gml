/// @description Draw for sink
draw_self();

// Draw progress bar
if (is_washing == true) {
	draw_sprite(spr_waiting_bar_border, 0, x, y-40);
	draw_sprite_stretched(spr_waiting_bar, 0, x-32, y-40, (counter/(room_speed*5)) * 64, 2);
}

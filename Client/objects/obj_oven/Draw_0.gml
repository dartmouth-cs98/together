/// @description Draw for oven
draw_self();

if (product != undefined) {
	draw_sprite(spr_waiting_bar_border, 0, x, y-40);
	draw_sprite_stretched(spr_waiting_bar, 0, x-32, y-40, (counter/(room_speed*10)) * 64, 2);
}

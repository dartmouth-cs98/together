/// @description Display username

if (global.show_visuals) {
	draw_self();
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_color(c_white);
	draw_text(x, y-32, username);
}
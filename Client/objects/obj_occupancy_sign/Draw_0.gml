/// @description Insert description here
// You can write your code in this editor

draw_self();

draw_set_halign(fa_center);
draw_set_font(Font3);
//(x, y - 5, "MAXIMUM OCCUPANCY")
if (number_string == "") draw_text(x + 13, y + 15, string(max_occupancy));
else if (number_string != "x"){
	draw_text(x + 13, y + 15, string(number_string));
}

draw_set_font(Font1);
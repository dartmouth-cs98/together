/// @description Insert description here
// You can write your code in this editor

draw_self();

draw_set_halign(fa_center);
draw_set_font(Font3);
//(x, y - 5, "MAXIMUM OCCUPANCY")
if (number_string == "") draw_text(x + 10, y + 5, string(max_occupancy));
else{draw_text(x + 10, y + 10, string(number_string))};

draw_set_font(Font1);
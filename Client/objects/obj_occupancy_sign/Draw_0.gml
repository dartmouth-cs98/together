/// @description Insert description here
// You can write your code in this editor

if (open){
	// Darken screen
	draw_set_alpha(0.3);
	draw_set_colour(c_black);
	draw_rectangle(0,0,room_width,room_height,-1);
	draw_set_alpha(1); //reset alpha value so it doesn't mess with other draw events	
}
draw_self();

draw_set_halign(fa_center);
draw_set_font(Font3);
//(x, y - 5, "MAXIMUM OCCUPANCY")
if (number_string == "") draw_text(x + 13, y + 15, string(max_occupancy));
else if (number_string != "x"){
	draw_text(x + 13, y + 15, string(number_string));
}

draw_set_font(Font1);

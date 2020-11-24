/// @description Draw the button

draw_set_color(merge_color(hover_color, color, hover));

draw_roundrect(x, y, x+width, y+height, 0);	// Rounded rectangle

draw_set_color(text_color);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text(x + width/2, y + height/2, text);
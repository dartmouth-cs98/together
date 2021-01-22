/// @description Draw self

// Draws a segment of the sprite sheet based on data model
draw_sprite_part(
	sprite_sheet,
	0,
	left_gap + (floor(x_frame) * (frame_width + h_sep)),	// Left
	top_gap + (y_frame * (frame_height + v_sep))-7,			// Top
	frame_width,
	frame_height+7,
	x - x_offset,
	y - y_offset);
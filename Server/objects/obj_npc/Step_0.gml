/// @description Move the NPC as appropriate

if (moving) {
	//var move_dir = point_direction(0, 0, h_input, v_input);
	var move_x = lengthdir_x(walk_speed, move_dir);
	var move_y = lengthdir_y(walk_speed, move_dir);	
					
	x += move_x;
	y += move_y;
						
	// Change which direction the player sprite is facing
	switch(move_dir) {
		case 0:		y_frame = 2; break;	// Right
		case 45:	y_frame = 2; break;	// Up-Right
		case 90:	y_frame = 3; break;	// Up
		case 135:	y_frame = 1; break;	// Up-Left
		case 180:	y_frame = 1; break;	// Left
		case 225:	y_frame = 1; break;	// Down-Left
		case 270:	y_frame = 0; break;	// Down
		case 315:	y_frame = 2; break;	// Down-Right
	}
							
	// Progress the walk animation
	x_frame += anim_speed/room_speed;
	if (x_frame >= anim_length) { x_frame = 0 };
} else {
	x_frame = 0.9; // Reset to idle, but high to prevent sliding
}
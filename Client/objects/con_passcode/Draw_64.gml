/// @description Draw the GUI associated with the passcode minigame

if (global.paused and global.minigame_passcode) {
	// TODO: The below code draws a rectangle over the buttons.
	// Figure out a way to re-order the draw events so the buttons are on top.
	/*
	var offset = 80;
	var rect_color = c_dkgray;
	draw_rectangle_color(	global.cam_width/2 - offset,		// Left
							global.cam_height/2 - offset,		// Top
							global.cam_width/2 + offset,		// Right
							global.cam_height/2 + offset,		// Bottom
							rect_color, rect_color, rect_color, rect_color, false);
	*/
	
	
	// Draw text
	draw_set_color(c_white);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text(global.cam_width/2, global.cam_height/2 - 105, "ENTER THE CORRECT PASSCODE:");
	draw_text(global.cam_width/2, global.cam_height/2 - 85, input);
	draw_text(global.cam_width/2, global.cam_height/2 + 125, "PASSCODE: " + passcode)
}
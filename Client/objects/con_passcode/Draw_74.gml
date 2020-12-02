/// @description Insert description here
// You can write your code in this editor

if (global.paused and global.minigame_passcode) {
	// Draw background
	var c = c_dkgray;
	draw_rectangle_color(0, 0, global.cam_width, global.cam_height, c, c, c, c, false);
}
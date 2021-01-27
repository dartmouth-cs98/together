/// @description Draw grey background
// For duotask
event_inherited();
if (global.paused and global.minigame_duotask) {
	// Draw background
	var c = c_dkgray;
	draw_rectangle_color(0, 0, global.cam_width, global.cam_height, c, c, c, c, false);
}
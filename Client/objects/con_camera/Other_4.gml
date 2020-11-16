/// @description Camera setup
/// Based on this tutorial series: https://www.youtube.com/watch?v=raGK_j1NVdE&list=PLhIbBGhnxj5JcbfoxS_CWTnImRL_wB_Wg

// Camera
// The "global." operator makes a variable into a global variable (shocking, I know).
global.cam_X = 0;
global.cam_Y = 0;
target = obj_player;

global.cam_width = 544;
global.cam_height = 306;

// Enabling a viewport & making it visible (0 in this case)
view_enabled = true;
view_visible[0] = true;

camera_set_view_size(view_camera[0], global.cam_width, global.cam_height);

// Set camera position to target
if (instance_exists(target)){
	// Center on player
	global.cam_X = target.x - (global.cam_width/2);
	global.cam_Y = target.y - (global.cam_height/2);
	
	// Clamp camera at edges edges are clear
	global.cam_X = clamp(global.cam_X, 0, room_width-global.cam_width);
	global.cam_Y = clamp(global.cam_Y, 0, room_height-global.cam_height);
}
camera_set_view_pos(view_camera[0], global.cam_X, global.cam_Y)

// Display
display_scale = 2;
display_width = global.cam_width * display_scale;
display_height = global.cam_height * display_scale;

window_set_size(display_width, display_height);
surface_resize(application_surface, display_width, display_height);

// GUI
display_set_gui_size(global.cam_width, global.cam_height);

alarm[0] = 1;
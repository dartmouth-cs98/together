				// Exit passcode																																																																			buttons[2] =	scr_create_button(global.cam_width/2 - _offset*2 - _width/2,	global.cam_height/2 - _height/2,						_width,
// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_duotask(object){
	with (obj_greencircle) {
		if ( !(global.any_menu and !global.minigame_duotask)) {
			if (!global.minigame_duotask and !global.any_menu) {
				global.minigame_duotask = true;
				global.any_menu = true;
				scr_pause();
				with (obj_player) {
					onObject = object;
				}
				var c = c_dkgray;
				draw_rectangle_color(0, 0, global.cam_width, global.cam_height, c, c, c, c, false);
				
				#region set up buttons
				var _width = 40;
				var _height = 40;
				var _color = c_white;
				var _hover_color = c_ltgray;
				var _text_color = c_black;
				var _offset = 45;
				var _sound = snd_Pickup01;
	
				// Parameters:							  x coordinate,									y coordinate,									width,	height,  text,			script,						parameters,		color,		hover_color,  text color,	sound
																																																																			
				// Submit, 0, and Backspace																																																															
				buttons[1] =	scr_create_button(global.cam_width/2 - _width/2,				global.cam_height/2 - _height/2,						_width, _height, "GO",			scr_duotask_on,				object,			c_green,	_hover_color, _text_color,	_sound);
																																																																			
				// Exit passcode																																																															
				buttons[2] =	scr_create_button(global.cam_width/2 - _offset*2 - _width/2,	global.cam_height/2 - _height/2,						_width, _height, "EXIT",		scr_duotask,				object,			c_orange,	_hover_color, _text_color,	_sound);
				
				#endregion

	
			} else {
				global.minigame_duotask = false;
				global.any_menu = false;
				
				with (obj_player) {
					onObject = obj_interactable;
				}
				scr_duotask_off(object);
				scr_unpause();
				for (var i = 0; i < array_length_1d(buttons); i++) {
					instance_destroy(buttons[i]);
				}
			}
		}
	}
>>>>>>> 80eaeb431081267ba0e3b6ba5ce637d22029e4ba
}

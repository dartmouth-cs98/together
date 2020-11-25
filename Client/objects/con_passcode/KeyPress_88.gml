/// @description FOR TESTING PURPOSES. IF THE PASSCODE MINIGAME WORKS, THIS SHOULD BE REMOVED AND IMPLEMENTED ELSEWHERE.

if ( !(global.any_menu and !global.minigame_passcode )) {	
	if (!global.minigame_passcode and !global.any_menu) {
		global.minigame_passcode = true;
		global.any_menu = true;
		scr_pause();
	
		#region set up buttons
	
		var _width = 40;
		var _height = 40;
		var _color = c_white;
		var _hover_color = c_ltgray;
		var _text_color = c_black;
		var _offset = 45;
	
	
		// Parameters:							  x coordinate,									y coordinate,									width,	height,  text,			script,					color,		hover_color,  text color
		// Top row
		passcode_buttons[0] =	scr_create_button(global.cam_width/2 - _offset - _width/2,		global.cam_height/2 - _offset - _height/2,		_width, _height, string(1),		scr_append_input,		_color,		_hover_color, _text_color);
		passcode_buttons[1] =	scr_create_button(global.cam_width/2 - _width/2,				global.cam_height/2 - _offset - _height/2,		_width, _height, string(2),		scr_append_input,		_color,		_hover_color, _text_color);
		passcode_buttons[2] =	scr_create_button(global.cam_width/2 + _offset - _width/2,		global.cam_height/2 - _offset - _height/2,		_width, _height, string(3),		scr_append_input,		_color,		_hover_color, _text_color);
	
		// Middle row
		passcode_buttons[3] =	scr_create_button(global.cam_width/2 - _offset - _width/2,		global.cam_height/2 - _height/2,				_width, _height, string(4),		scr_append_input,		_color,		_hover_color, _text_color);
		passcode_buttons[4] =	scr_create_button(global.cam_width/2 - _width/2,				global.cam_height/2 - _height/2,				_width, _height, string(5),		scr_append_input,		_color,		_hover_color, _text_color);
		passcode_buttons[5] =	scr_create_button(global.cam_width/2 + _offset - _width/2,		global.cam_height/2 - _height/2,				_width, _height, string(6),		scr_append_input,		_color,		_hover_color, _text_color);
	
		// Bottom row
		passcode_buttons[6] =	scr_create_button(global.cam_width/2 - _offset - _width/2,		global.cam_height/2 + _offset - _height/2,		_width, _height, string(7),		scr_append_input,		_color,		_hover_color, _text_color);
		passcode_buttons[7] =	scr_create_button(global.cam_width/2 - _width/2,				global.cam_height/2 + _offset - _height/2,		_width, _height, string(8),		scr_append_input,		_color,		_hover_color, _text_color);
		passcode_buttons[8] =	scr_create_button(global.cam_width/2 + _offset - _width/2,		global.cam_height/2 + _offset - _height/2,		_width, _height, string(9),		scr_append_input,		_color,		_hover_color, _text_color);
	
		// Enter & Backspace
		passcode_buttons[9] =	scr_create_button(global.cam_width/2 - _width/2,				global.cam_height/2 + (2*_offset) - _height/2,	_width, _height, "GO",			scr_submit_passcode,	c_green,	_hover_color, _text_color);
		passcode_buttons[10] =	scr_create_button(global.cam_width/2 + _offset - _width/2,		global.cam_height/2 + (2*_offset) - _height/2,	_width, _height, "X",			scr_backspace,			c_red,		_hover_color, _text_color);
	
		#endregion
	
		#region generate passcode
	
		var d1 = string(irandom(9));
		var d2 = string(irandom(9));
		var d3 = string(irandom(9));
		var d4 = string(irandom(9));
		var d5 = string(irandom(9));
		passcode = d1+d2+d3+d4+d5;
	
		#endregion
	
	} else {
		global.minigame_passcode = false;
		global.any_menu = false;
		scr_unpause();
		for (var i = 0; i < array_length_1d(passcode_buttons); i++) {
			instance_destroy(passcode_buttons[i]);
		}
	}
}
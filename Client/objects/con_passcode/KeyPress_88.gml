/// @description FOR TESTING PURPOSES. IF THE PASSCODE MINIGAME WORKS, THIS SHOULD BE REMOVED AND IMPLEMENTED ELSEWHERE.

if (!global.minigame_passcode) {
	global.minigame_passcode = true;
	scr_pause();
	
	
	var _width = 40;
	var _height = 40;
	var _color = c_white;
	var _hover_color = c_ltgray;
	var _text_color = c_black;
	var _offset = 45;
	
	
	// Top row
	passcode_buttons[0] = scr_create_button(global.cam_width/2 - _offset - _width/2,		global.cam_height/2 - _offset - _height/2,		_width, _height, string(1), scr_test_click, _color, _hover_color, _text_color);
	passcode_buttons[1] = scr_create_button(global.cam_width/2 - _width/2,					global.cam_height/2 - _offset - _height/2,		_width, _height, string(2), scr_test_click, _color, _hover_color, _text_color);
	passcode_buttons[2] = scr_create_button(global.cam_width/2 + _offset - _width/2,		global.cam_height/2 - _offset - _height/2,		_width, _height, string(3), scr_test_click, _color, _hover_color, _text_color);
	
	// Middle row
	passcode_buttons[3] = scr_create_button(global.cam_width/2 - _offset - _width/2,		global.cam_height/2 - _height/2,				_width, _height, string(4), scr_test_click, _color, _hover_color, _text_color);
	passcode_buttons[4] = scr_create_button(global.cam_width/2 - _width/2,					global.cam_height/2 - _height/2,				_width, _height, string(5), scr_test_click, _color, _hover_color, _text_color);
	passcode_buttons[5] = scr_create_button(global.cam_width/2 + _offset - _width/2,		global.cam_height/2 - _height/2,				_width, _height, string(6), scr_test_click, _color, _hover_color, _text_color);
	
	// Bottom row
	passcode_buttons[6] = scr_create_button(global.cam_width/2 - _offset - _width/2,		global.cam_height/2 + _offset - _height/2,		_width, _height, string(7), scr_test_click, _color, _hover_color, _text_color);
	passcode_buttons[7] = scr_create_button(global.cam_width/2 - _width/2,					global.cam_height/2 + _offset - _height/2,		_width, _height, string(8), scr_test_click, _color, _hover_color, _text_color);
	passcode_buttons[8] = scr_create_button(global.cam_width/2 + _offset - _width/2,		global.cam_height/2 + _offset - _height/2,		_width, _height, string(9), scr_test_click, _color, _hover_color, _text_color);
	
	
	
} else {
	global.minigame_passcode = false;
	scr_unpause();
	for (var i = 0; i < array_length_1d(passcode_buttons); i++) {
		instance_destroy(passcode_buttons[i]);
	}
}
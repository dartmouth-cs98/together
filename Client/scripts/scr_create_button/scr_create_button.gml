///@description Creates a button based on input parameters
function scr_create_button(_x, _y, _width, _height, _text, _script, _params, _color, _hover_color, _text_color){
	var _button = instance_create_layer(_x, _y, "Instances", obj_button);
	
	with (_button) {
		width = _width;
		height = _height;
		text = _text;
		button_script = _script;
		params = _params;
		color = _color;
		hover_color = _hover_color;
		text_color = _text_color;
	}
	
	return _button;
}
/// @description Check if a button is clicked

var _is_hovering = scr_get_hover();
var _click = _is_hovering && mouse_check_button_pressed(mb_left);

hover = lerp(hover, _is_hovering, 0.1);

if (_click and (button_script != -1)) {
	audio_play_sound(sound, 1, false);
	script_execute(button_script, params);
}
/// @description Insert description here
// You can write your code in this editor

if (keyboard_check_released(vk_anykey) and string_length(number_string) < 2){

	if (keyboard_key == 0) number_string = string_insert("0", number_string, string_length(number_string) - 1);
	if (keyboard_key == 1) number_string = string_insert("1", number_string, string_length(number_string) - 1);
	if (keyboard_key == 2) number_string = string_insert("2", number_string, string_length(number_string) - 1);
	if (keyboard_key == 3) number_string = string_insert("3", number_string, string_length(number_string) - 1);
	if (keyboard_key == 4) number_string = string_insert("4", number_string, string_length(number_string) - 1);
	if (keyboard_key == 5) number_string = string_insert("5", number_string, string_length(number_string) - 1);
	if (keyboard_key == 6) number_string = string_insert("6", number_string, string_length(number_string) - 1);
	if (keyboard_key == 7) number_string = string_insert("7", number_string, string_length(number_string) - 1);
	if (keyboard_key == 8) number_string = string_insert("8", number_string, string_length(number_string) - 1);
	if (keyboard_key == 9) number_string = string_insert("9", number_string, string_length(number_string) - 1);
}

if (keyboard_check(vk_backspace)) string_delete(number_string, string_length(number_string) - 1, 1);
if (keyboard_check(vk_enter) and string_length(number_string) == 2 and number_string == desired_string){
	open = false;
	finished = true;
	global.any_menu = false;
	scr_unpause();
}
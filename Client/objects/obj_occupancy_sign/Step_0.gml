/// @description Insert description here
// You can write your code in this editor

if (keyboard_check_released(vk_anykey) and string_length(number_string) < 2 and open and !finished){

	if (keyboard_check_released(ord("0"))) number_string = string_insert("0", number_string, string_length(number_string) + 1);
	if (keyboard_check_released(ord("1"))) number_string = string_insert("1", number_string, string_length(number_string) + 1);
	if (keyboard_check_released(ord("2"))) number_string = string_insert("2", number_string, string_length(number_string) + 1);
	if (keyboard_check_released(ord("3"))) number_string = string_insert("3", number_string, string_length(number_string) + 1);
	if (keyboard_check_released(ord("4"))) number_string = string_insert("4", number_string, string_length(number_string) + 1);
	if (keyboard_check_released(ord("5"))) number_string = string_insert("5", number_string, string_length(number_string) + 1);
	if (keyboard_check_released(ord("6"))) number_string = string_insert("6", number_string, string_length(number_string) + 1);
	if (keyboard_check_released(ord("7"))) number_string = string_insert("7", number_string, string_length(number_string) + 1);
	if (keyboard_check_released(ord("8"))) number_string = string_insert("8", number_string, string_length(number_string) + 1);
	if (keyboard_check_released(ord("9"))) number_string = string_insert("9", number_string, string_length(number_string) + 1);
}

if (keyboard_check_released(vk_backspace) and !finished and open) string_delete(number_string, string_length(number_string) - 2, 1);
if (keyboard_check_released(vk_enter) and string_length(number_string) == 2 and number_string == desired_string){
	open = false;
	finished = true;
	global.any_menu = false;
	scr_unpause();
}
//show_debug_message("Number string: " + number_string);
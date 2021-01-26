/// @description Move option up
if (itemSelected != undefined) {
	option -= 1;
	ds_list_size(itemSelected.optionNames);
	show_debug_message(string(ds_list_size(itemSelected.options)));
	option = clamp(option, 0, ds_list_size(itemSelected.options) -1);
}
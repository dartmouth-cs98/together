/// @description Move option down
if (itemSelected != undefined) {
	option += 1;
	option = clamp(option, 0, ds_list_size(itemSelected.options) -1);
}
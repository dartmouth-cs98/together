/// @description Destroy created data structures
var i = 0;
repeat(array_length_1d(menu_pages)) {
	ds_grid_destroy(menu_pages[i]);
	i++;
}
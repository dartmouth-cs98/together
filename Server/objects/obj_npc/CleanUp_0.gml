/// @description Destroy created data structures

ds_list_destroy(current_neighbors);
if (path != noone) {
	ds_list_destroy(path);	
}
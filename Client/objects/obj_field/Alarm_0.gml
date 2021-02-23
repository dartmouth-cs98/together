/// @description Insert description here
// You can write your code in this editor

for (i = 0; i < ds_list_size(wheat_list_x); i++){

	instance_create_layer(ds_list_find_value(wheat_list_x,i), ds_list_find_value(wheat_list_y,i), "Instances", obj_wheat);
}
ds_list_empty(wheat_list_x);
ds_list_empty(wheat_list_y);
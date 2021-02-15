/// @description Insert description here
// You can write your code in this editor

if (!hasRung){
	desired_string = ds_list_find_value(obj_computer.max_occupancy_list, obj_computer.current_sign);
	obj_computer.current_sign++;
	hasRung = true;
}
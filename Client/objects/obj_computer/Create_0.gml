/// @description Insert description here
// You can write your code in this editor

myname = "obj_computer"
object1 = spr_computer1;
object2 = spr_computer2;
task = "Set Max Occupancies";

finished = false;
open = false;
contaminated = false;
max_occupancy_list = ds_list_create();
sign_count = 3;
current_sign = 0;

for (i = 0; i < sign_count; i++){
	num1 = irandom(99);
	while (num1 < 10){
		num1 = irandom(99);	
	}

	desired_string = string(num1);
	ds_list_add(max_occupancy_list, desired_string);
}

myscript = scr_open_computer;
sprite_index = object1;
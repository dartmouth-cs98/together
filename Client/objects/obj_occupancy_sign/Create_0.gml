/// @description Insert description here
// You can write your code in this editor

myname = "obj_occupancy_sign"
object1 = spr_sign1;
object2 = spr_sign2;
max_occupancy = 100;
number_string = "";
task = "Set Max Occupancies";

finished = false;
open = false;
contaminated = false;

num1 = irandom(99);
while (num1 < 10){
	num1 = irandom(99);	
}
num2 = irandom(99);
while (num2 < 10){
	num2 = irandom(99);
}

desired_string = string(num1);
desired_string = string_insert(string(num2), desired_string, string_length(desired_string) - 1);

myscript = scr_open_sign;
sprite_index = object1;
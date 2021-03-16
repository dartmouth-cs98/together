/// @description Insert description here
// You can write your code in this editor

open = false;
finished = false;
a = false;
a_val = irandom_range(100,130);
b = false;
b_val = irandom_range(15, 35);
c = false;
c_val = irandom(3);
d = false;
d_val = irandom_range(70, 130);
e = false;

myname = "canvas";
object1 = spr_hospital1;
object2 = spr_hospital2;
task = "Checkup";
contaminated = false;
alarm[0] = room_speed * 2;
arm_in = false;
other_arm_in = false;
doctor_in = false;

myscript = scr_open_hospital;
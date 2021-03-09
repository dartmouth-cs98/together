/// @description Insert description here
// You can write your code in this editor

open = false;
finished = false;
x_positions = ds_list_create();
y_positions = ds_list_create();

start_x = 100;
start_y = 240;
destination_x = 400;
destination_y = 40;

myname = "canvas";
object1 = spr_canvas1;
object2 = spr_canvas2;
task = "Graph Disease Progression";
contaminated = false;

myscript = scr_open_canvas;
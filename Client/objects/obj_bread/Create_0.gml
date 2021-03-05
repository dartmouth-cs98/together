/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

object1 = spr_bread1;
object2 = spr_bread2;

ds_list_insert(optionNames, 2, "Eat");

ds_list_insert(options, 2, scr_eat);

myscript = scr_pickup_and_destroy;

sprite_index = object1;
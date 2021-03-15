/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

object1 = spr_bread1;
object2 = spr_bread2;

object_id = 0;

ds_list_insert(optionNames, 2, "Eat");
ds_list_insert(options, 2, scr_eat);

ds_list_replace(options, 1, scr_server_drop);

myscript = scr_server_pickup;

sprite_index = object1;
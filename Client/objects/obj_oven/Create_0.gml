/// @description Set up oven object

// Inherit the parent event
event_inherited();

object1 = spr_oven1;
object2 = spr_oven2;

task = "Cooking";

myscript = scr_cooking;

// For cooking
is_cooking = false;
product = undefined;
counter = 0;
/// @description On Create
event_inherited();
// Object name, change in children
myname = "bag";

// Object 1 is the unhighlighted sprite
// Object 2 is the highlighted sprite
// Change these in the children
object1 = spr_bag1;
object2 = spr_bag2;
task = "Collect Apples";

// For collecting objects, can ignore if not relevant
collects = "obj_apple";

taskvalue = 1;

empty_message = "You don't have any apples in your inventory! Ask the farmer for some!";

// Default script, change in children
myscript = scr_collect;

sprite_index = object1;
contaminated = false;
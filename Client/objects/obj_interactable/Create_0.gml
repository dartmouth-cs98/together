/// @description On Create
// Object name, change in children
myname = "object";

// Object 1 is the unhighlighted sprite
// Object 2 is the highlighted sprite
// Change these in the children
object1 = spr_object1;
object2 = spr_object2;

taskvalue = 5; // Default value of task completion

germs = 0; // Int to keep track of germs on an object

// For collecting objects, can ignore if not relevant
collects = "obj_apple";

// For duo tasks
sentduotask = false;

// Default script, change in children, (do not call script)
myscript = scr_pickup;

sprite_index = object1;
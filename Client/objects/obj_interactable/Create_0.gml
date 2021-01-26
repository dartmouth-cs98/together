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

// For item options, only for objects you can pick up.
optionNames = ds_list_create();
ds_list_insert(optionNames, 0, "Back"); ds_list_insert(optionNames, 1, "Drop"); // Default options
options = ds_list_create();
ds_list_insert(options, 0, scr_back); ds_list_insert(options, 1, scr_drop); // Default options

// Default script, change in children, (do not call script)
myscript = scr_pickup;

sprite_index = object1;
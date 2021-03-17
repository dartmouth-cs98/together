/// @description On Create
event_inherited();

object1 = spr_collectionbox1;
object2 = spr_collectionbox2;

task = "Deliver Packages";

// For collecting objects, can ignore if not relevant
collects = "obj_package";

taskvalue = 5;

empty_message = "You don't have any packages in your inventory!";

myscript = scr_collect;
/// @description Create mailbox object
event_inherited();

object1 = spr_mailbox1;
object2 = spr_mailbox2;

task = "Deliver Mail";

collects = "obj_letter";

empty_message = "You don't have any letters in your inventory!";

taskvalue = 5;

myscript = scr_collect_and_destroy;
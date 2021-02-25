/// @description Insert description here
// You can write your code in this editor

for (i = 0; i < obj_farmhouse.seed_packet_count; i++){

	var current_seed_bag = instance_find(obj_seeds_bag, i);
	show_debug_message("Current seed x: " + string(current_seed_bag.x));
	show_debug_message("Current seed y: " + string(current_seed_bag.y));
	if (current_seed_bag.x > boundary_x0 and current_seed_bag.x < boundary_x1 and current_seed_bag.y > boundary_y0 and current_seed_bag.y < boundary_y1){

		var wheat = instance_create_layer(current_seed_bag.x, current_seed_bag.y, "Instances", obj_wheat);
		object_set_visible(wheat, false);
		ds_list_add(wheat_list_x, wheat.x);
		ds_list_add(wheat_list_y, wheat.y);
		instance_destroy(current_seed_bag);
		obj_farmhouse.seed_packet_count--;
		show_debug_message("Bag destroyed!");
	}
}
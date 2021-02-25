		/// @description Controls NPC creation and behavior

npc_infection_level = 0;
alarm[0] = room_speed * 120;

npc_list = ds_list_create();

ds_list_add(npc_list, instance_create_layer(340, 185, "Instances", obj_npc));
ds_list_add(npc_list, instance_create_layer(670, 185, "Instances", obj_npc));
ds_list_add(npc_list, instance_create_layer(1000, 185, "Instances", obj_npc));
ds_list_add(npc_list, instance_create_layer(1000, 260, "Instances", obj_npc));
ds_list_add(npc_list, instance_create_layer(1280, 260, "Instances", obj_npc));
/*
ds_list_add(npc_list, instance_create_layer(1675, 196, "Instances", obj_npc));
ds_list_add(npc_list, instance_create_layer(340, 430, "Instances", obj_npc));
ds_list_add(npc_list, instance_create_layer(670, 430, "Instances", obj_npc));
ds_list_add(npc_list, instance_create_layer(1000, 430, "Instances", obj_npc));
ds_list_add(npc_list, instance_create_layer(365, 625, "Instances", obj_npc));
ds_list_add(npc_list, instance_create_layer(515, 625, "Instances", obj_npc));
ds_list_add(npc_list, instance_create_layer(670, 625, "Instances", obj_npc));
ds_list_add(npc_list, instance_create_layer(1000, 625, "Instances", obj_npc));
ds_list_add(npc_list, instance_create_layer(1280, 625, "Instances", obj_npc));
ds_list_add(npc_list, instance_create_layer(1675, 650, "Instances", obj_npc));
ds_list_add(npc_list, instance_create_layer(1870, 650, "Instances", obj_npc));
ds_list_add(npc_list, instance_create_layer(515, 890, "Instances", obj_npc));
ds_list_add(npc_list, instance_create_layer(1280, 850, "Instances", obj_npc));
ds_list_add(npc_list, instance_create_layer(1675, 850, "Instances", obj_npc));
ds_list_add(npc_list, instance_create_layer(1870, 850, "Instances", obj_npc));
ds_list_add(npc_list, instance_create_layer(2040, 850, "Instances", obj_npc));
ds_list_add(npc_list, instance_create_layer(460, 1000, "Instances", obj_npc));
ds_list_add(npc_list, instance_create_layer(355, 1045, "Instances", obj_npc));
ds_list_add(npc_list, instance_create_layer(355, 1145, "Instances", obj_npc));
*/

/*
for (var i = 1; i <= 5; i++) {
	ds_list_add(npc_list, instance_create_layer(100*i, 100*i, "Instances", obj_npc));
}
*/

/*
ds_list_add(npc_list, instance_create_layer(100, 100, "Instances", obj_npc));
ds_list_add(npc_list, instance_create_layer(200, 200, "Instances", obj_npc));
ds_list_add(npc_list, instance_create_layer(300, 300, "Instances", obj_npc));
*/
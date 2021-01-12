/// @description Controls NPC creation and behavior

npc_list = ds_list_create();

ds_list_add(npc_list, instance_create_layer(100, 100, "Instances", obj_npc));
ds_list_add(npc_list, instance_create_layer(200, 200, "Instances", obj_npc));
ds_list_add(npc_list, instance_create_layer(300, 300, "Instances", obj_npc));
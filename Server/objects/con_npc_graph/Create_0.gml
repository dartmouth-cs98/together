/// @description Graph that represents NPC-walkable areas. Controls where they can move.

node_list = ds_list_create();

// Column 1
n11 = instance_create_layer(100, 100, "Instances", con_npc_graph_node);
n12 = instance_create_layer(100, 200, "Instances", con_npc_graph_node);
n13 = instance_create_layer(100, 300, "Instances", con_npc_graph_node);

// Column 2
n21 = instance_create_layer(200, 100, "Instances", con_npc_graph_node);
n22 = instance_create_layer(200, 200, "Instances", con_npc_graph_node);
n23 = instance_create_layer(200, 300, "Instances", con_npc_graph_node);

// Column 3
n31 = instance_create_layer(300, 100, "Instances", con_npc_graph_node);
n32 = instance_create_layer(300, 200, "Instances", con_npc_graph_node);
n33 = instance_create_layer(300, 300, "Instances", con_npc_graph_node);

ds_list_add(	node_list,
				n11, n12, n13,
				n21, n22, n23,
				n31, n32, n33);

// Add neigbors

// Column 1
ds_list_add(n11.neighbors, n12, n21);
ds_list_add(n12.neighbors, n11, n22, n13);
ds_list_add(n13.neighbors, n12, n23);

// Column 2
ds_list_add(n21.neighbors, n11, n22, n31);
ds_list_add(n22.neighbors, n21, n12, n23, n32);
ds_list_add(n23.neighbors, n13, n22, n33);

// Column 3
ds_list_add(n31.neighbors, n21, n32);
ds_list_add(n32.neighbors, n31, n22, n33);
ds_list_add(n33.neighbors, n32, n23);
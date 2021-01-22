///@Description This algorithm will return the shortest path of nodes from the start node to the target.
// Bellman-Ford was intended for directed graphs, so we treat each edge as being two edges: (u, v) and (v, u)
// The returned value is a ds_list. It needs to be destroyed when you're done w/ it.

function scr_bellman_ford(start_node, target_node){
	var distance = ds_list_create();
	var predecessor = ds_list_create();
	
	for (var i = 0; i < ds_list_size(con_npc_graph.node_list); i++) {
		// List of distances between the start node the node w/ index i in con_npc_graph.node_list
		ds_list_insert(distance, i, 2147483647); // Max int in GML. Not sure if there's a function for it
		
		// List of indicies of nodes' predecessors
		ds_list_insert(predecessor, i, noone);
	}
	
	// Start node's distance from itself is 0;
	ds_list_replace(distance, ds_list_find_index(con_npc_graph.node_list, start_node), 0);
	
	repeat (ds_list_size(con_npc_graph.node_list) - 1) {
		for (var e = 0; e < ds_list_size(con_npc_graph.edge_list); e++) {
			var edge = ds_list_find_value(con_npc_graph.edge_list, e);
			var U = edge[0];
			var V = edge[1];
			var edge_length = point_distance(U.x, U.y, V.x, V.y);
		
			var U_index = ds_list_find_index(con_npc_graph.node_list, U);
			var V_index = ds_list_find_index(con_npc_graph.node_list, V);
		
			var U_distance = ds_list_find_value(distance, U_index);
			var V_distance = ds_list_find_value(distance, V_index);
		
			if (U_distance + edge_length < V_distance) {
					ds_list_replace(distance, V_index, U_distance + edge_length);
					ds_list_replace(predecessor, V_index, U);
			}
		}
	}
	
	var path = ds_list_create();
	var current_node = target_node;
	ds_list_add(path, current_node);
	
	while (current_node != start_node) {
		// This line is a little complicated:
		// 1. It finds the current node's index in the node_list
		// 2. It uses that index to find its predecessor
		// 3. It sets the oredecessir to be current_node's value
		// 4. ???
		// 5. Profit
		current_node = ds_list_find_value(predecessor, ds_list_find_index(con_npc_graph.node_list, current_node));
		ds_list_insert(path, 0, current_node);
		//ds_list_add(path, current_node);
	}
	ds_list_destroy(distance);
	ds_list_destroy(predecessor);
	
	return path;
}
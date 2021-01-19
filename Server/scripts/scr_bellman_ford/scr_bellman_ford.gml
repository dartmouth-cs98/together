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
	
	/*
	// For each node pair...
	for (var u = 0; u < ds_list_size(con_npc_graph.node_list); u++) {
		for (var v = 0; v < ds_list_size(con_npc_graph.node_list); v++) {
			var node_u = ds_list_find_value(con_npc_graph.node_list, u);
			var node_v = ds_list_find_value(con_npc_graph.node_list, v);
			
			// ...if there's an edge...
			if ((ds_list_find_index(node_u.neighbors, node_v) > 0) and (ds_list_find_index(node_v.neighbors, node_u) > 0)) {
				var dist_u = ds_list_find_value(distance, u);
				var dist_v = ds_list_find_value(distance, v);
				var edge_length = point_direction(node_u.x, node_u.y, node_v.x, node_v.y);
			
				// ...if v's current distance is greater than it would be if the path went through u...
				if (dist_u + edge_length < dist_v) {
					// ...update v's distance & make u its predecessor
					ds_list_replace(distance, v, dist_u + edge_length);
					ds_list_replace(predecessor, v, u);
				}
			}
		}
	}
	*/
	
	var path = ds_list_create();
	var current_node = target_node;
	ds_list_add(path, current_node);
	
	while (current_node != start_node) {
		show_debug_message("WHILE LOOP");
		
		// This line is a little complicated:
		// 1. It finds the current node's index
		// 2. It uses that index to find its predecessor's index
		// 3. It finds the node value that corresponds to the predecessor's index
		// 4. It sets that to be current_node's value
		current_node = ds_list_find_value(predecessor, ds_list_find_index(con_npc_graph.node_list, current_node));
		ds_list_add(path, current_node);
	}
	show_debug_message("WE GOIN");
	ds_list_destroy(distance);
	ds_list_destroy(predecessor);
	
	return path;
}

/*
	Algorithm:
	
	target_node = random node from con_npc_graph
	scr_node_search(self, con_npc_graph, current_node, target_node)
	
	Bellman-Ford Script:
	scr_bellman_ford(npc, graph, start_node, target_node) {
		distance = []
		predecessor = []
		
		for each node in graph.node_list {
			distance[index] = 2147483647 // max int
			predecessor[index] = noone
		}
		
		distance[start_node] = 0
		
		repeat(# of nodes - 1) {
			for each neighbor of node (index) {
				if (distance[neighbor] + distance_between(node, neighbor) < distance[node]) {
					distance[node] = distance[neighbor] + distance_between(node, neighbor)
					predecessor[node] = neighbor
				}
			}
		}
		
		// Reconstruct path back from target node
		current_node = target_node
		path = []
		path.add(current_node)
		while (current_node != start_node) {
			current_node = predecessor[current_node]
			path.add(current_node)
		}
	}
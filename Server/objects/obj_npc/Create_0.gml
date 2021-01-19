/// @description Initialize NPC

#region animation
sprite_sheet = spr_skeleton_pink_sheet;

// int [POSSIBLY UNNEEDED]
default_walk_speed = 3;
walk_speed = default_walk_speed;

// Int, gaps at the top and left of the sprite sheet
left_gap = 8;
top_gap = 18;

// Int, width & height of one fame of a mithril age sprite
frame_width = 32;	
frame_height = 46;

// Int, coordinates of the anchor point on a given frame of the animation
x_offset = 16;
y_offset = 23;

x_frame = 0;	// Int, which frame in the row of the spritesheet are we on?
y_frame = 0;	// Int, which row of the spritesheet are we on?

// Int, horizontal & vertical separation between frames on the spritesheet
h_sep = 16;
v_sep = 18;

anim_length = 4; // Int, # of frames in an animation [POSSIBLY UNNEEDED]
anim_speed = 8; // Int, how fast it animates [POSSIBLY UNNEEDED]
#endregion

#region control movement

randomize(); // Ensures that random movement is different each game

moving = true; // Boolean, used to determine if the NPC is moving or not

enum npc_mode {
	random_walk,
	random_target_bfs
}

mode = npc_mode.random_target_bfs;

// Walk in a square
// alarm_set(0, 2 * room_speed);

//ds_list_add(con_npc_controller.npc_list, self.id);

// IDs of the node the NPC started at, the node it's currently at, the node it was at last, and the node it's going to next
// start_node variable may not be needed
start_node = instance_nearest(x, y, con_npc_graph_node);
current_node = start_node;
prev_node = noone;
next_node = noone;
target_node = noone;
path = noone;

if (mode == npc_mode.random_walk) {
	// Determine random next node
	while (next_node == noone || next_node == current_node) {
		next_node = ds_list_find_value(current_node.neighbors, random_range(0, ds_list_size(current_node.neighbors) - 1));
	}
}
else if (mode == npc_mode.random_target_bfs) {
	while (target_node == noone || target_node == current_node) {
		target_node = ds_list_find_value(con_npc_graph.node_list, random_range(0, ds_list_size(con_npc_graph.node_list) - 1));
	}
	path = scr_bellman_ford(start_node, target_node);
	next_node = ds_list_find_value(path, 0);
	ds_list_delete(path, 0);
	
	#region TEMP pseudocode for bellman-ford
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
	
	///////////////////////////
	PSEUDOCODE
	function BellmanFord(list vertices, list edges, vertex source) is

    // This implementation takes in a graph, represented as
    // lists of vertices (represented as integers [0..n-1]) and edges,
    // and fills two arrays (distance and predecessor) holding
    // the shortest path from the source to each vertex

    distance := list of size n
    predecessor := list of size n

    // Step 1: initialize graph
    for each vertex v in vertices do
        distance[v] := inf             // Initialize the distance to all vertices to infinity
        predecessor[v] := null         // And having a null predecessor
    
    distance[source] := 0              // The distance from the source to itself is, of course, zero

    // Step 2: relax edges repeatedly
    repeat |V|−1 times:
        for each edge (u, v) with weight w in edges do
            if distance[u] + w < distance[v] then
                distance[v] := distance[u] + w
                predecessor[v] := u

    // Step 3: check for negative-weight cycles
    for each edge (u, v) with weight w in edges do
        if distance[u] + w < distance[v] then
            error "Graph contains a negative-weight cycle"

    return distance, predecessor
	///////////////////////////
	
	BFSScript:
	scr_node_bfs (npc, graph, start_node, target_node) {
		current_node = noone;
		frontier = a_queue
		frontier.add(start_node)
		
		path = []
		explored = []
		
		while (frontier.size > 0) {
			current = fronteir.pop
			explored.add(current)
			for each node in current.neighbors {
				next = node_from_loop
				if (next isn't in fronteir or explored) {
					if (next == target)
					frontier.add(next);
				}
			}
		}
	}
	
	*/
	#endregion
} else {
	show_debug_message("=========================================================");
	show_debug_message("NPC ERROR: mode not recognized in create event");
	show_debug_message("mode = " + string(mode));
	show_debug_message("=========================================================");	
}

x = start_node.x;
y = start_node.y;

// Int, direction of NPC movement
move_dir = point_direction(x, y, next_node.x, next_node.y);

// List of IDs of neighbor nodes of the current node
current_neighbors = ds_list_create();
ds_list_copy(current_neighbors, current_node.neighbors);

// Int, number of nodes in the list of neighbors
num_neighbors = ds_list_size(current_neighbors);

#endregion
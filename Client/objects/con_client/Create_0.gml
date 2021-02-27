/// @description Set up client
// Con client is intended to control networking

// Enums: network.player_establish = 0, because move is at index 0 of this enumerator.
// Server should have same enum.
enum network {
	player_establish,		// 
	player_connect,			// For managing a player connecting
	player_joined,			// For when another player joins
	player_disconnect,		// For removing a player when they disconnect
	player_denied,			// For when too many players join
	move,					// For when a player moves
	chat,					// For handling chat messages being sent
	task,					// For handling task bar progress
	pause,					// To keep player from animating on other machines
	unpause,				// To restore normal animation after unpausing
	npc_create,			// To set up NPCs on clients
	npc_move,			// To broadcast NPC movement to players
	revive,					// To restore a fallen player to health
	update_infection_level, // To keep all players apprised of each other's infection level
	duotask,					// For handling tasks that require two players
	event,
	update_npc_infection_level
}

#region An enum & ds map for colors, makes it easier to send color IDs across the internet
enum colors {
	aqua,		// 0
	black,		// 1
	blue,		// 2
	dkgray,		// 3
	fuchsia,	// 4
	gray,		// 5
	green,		// 6
	lime,		// 7
	ltgray,		// 8
	maroon,		// 9
	navy,		// 10
	olive,		// 11
	orange,		// 12
	purple,		// 13
	red,		// 14
	silver,		// 15
	teal,		// 16
	white,		// 17
	yellow		// 18
}

color_map = ds_map_create();
ds_map_add(color_map, colors.aqua, c_aqua);
ds_map_add(color_map, colors.black, c_black);
ds_map_add(color_map, colors.blue, c_blue);
ds_map_add(color_map, colors.dkgray, c_dkgray);
ds_map_add(color_map, colors.fuchsia, c_fuchsia);
ds_map_add(color_map, colors.gray, c_gray);
ds_map_add(color_map, colors.green, c_green);
ds_map_add(color_map, colors.lime, c_lime);
ds_map_add(color_map, colors.ltgray, c_ltgray);
ds_map_add(color_map, colors.maroon, c_maroon);
ds_map_add(color_map, colors.navy, c_navy);
ds_map_add(color_map, colors.olive, c_olive);
ds_map_add(color_map, colors.orange, c_orange);
ds_map_add(color_map, colors.purple, c_purple);
ds_map_add(color_map, colors.red, c_red);
ds_map_add(color_map, colors.silver, c_silver);
ds_map_add(color_map, colors.teal, c_teal);
ds_map_add(color_map, colors.white, c_white);
ds_map_add(color_map, colors.yellow, c_yellow);
#endregion


// Connection type has to be the same for client & server
client = network_create_socket(network_socket_tcp);
//client = network_create_socket_ext(network_socket_udp, 64198);

// 127.0.0.1 is localhost
// To get your INTERNAL IP address, open command prompt, type ipconfig. IPv4 address
// To get your EXTERNAL IP address (the one that other computers can actually use), google "what is my IP address?"
// Only people on your network would be able to connect to your local IP address
// Same port for client & server (64198)

// Localhost, works only on an individual machine
network_connect(client, "127.0.0.1", 64198);

// IP address (external),
// Allows people to join a server on Will's laptop
// while he isusing the Katheriine network on the Phi Tau router.
//network_connect(client, "129.170.131.247", 64198);

// This one is for DKS-VM
//network_connect(client, "52.188.114.168", 64198);

// This one is for DKS-VM-2
//network_connect(client, "52.146.11.47", 64198);

// This buffer defaults to 1024 bytes, but can grow to a greater size when needed
client_buffer = buffer_create(1024, buffer_grow, 1);

socket_to_instanceid = ds_map_create();

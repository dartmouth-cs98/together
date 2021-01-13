/// @description Initialize NPC

#region animation
sprite_sheet = spr_skeleton_pink_sheet;

// int [POSSIBLY UNNEEDED]
default_walk_speed = 4;
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

moving = true; // Boolean, used to determine if the NPC is moving or not

// Walk in a square
// alarm_set(0, 2 * room_speed);

ds_list_add(con_npc_controller.npc_list, self);

// IDs of the node the NPC started at, the node it's currently at, the node it was at last, and the node it's going to next
// start_node variable may not be needed
start_node = instance_nearest(x, y, con_npc_graph_node);
current_node = start_node;
prev_node = noone;

// Determine random next node
next_node = noone;
while (next_node == noone || next_node == current_node) {
	next_node = ds_list_find_value(current_node.neighbors, random_range(0, ds_list_size(current_node.neighbors) - 1));
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
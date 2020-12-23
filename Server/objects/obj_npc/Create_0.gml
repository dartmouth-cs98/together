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
move_dir = 270; // Int, direction of NPC movement

// Walk in a square
//alarm_set(0, 2 * room_speed);

#endregion
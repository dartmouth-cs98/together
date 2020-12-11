/// @description Initialize other player sprite

#region animation
sprite_sheet = spr_skeleton_gray_sheet;
walk_speed = 4; // int

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

anim_length = 4; // Int, # of frames in an animation
anim_speed = 8; // Int, how fast it animates
#endregion

username = "";
infection_level = 0; // int
player_color = c_black; // string
hat = ""; // string
role = ""; // string

image_angle = 0;
time_since_hands_washed = 0; // double
mask_on = false; // bool

draw_set_font(Font1);
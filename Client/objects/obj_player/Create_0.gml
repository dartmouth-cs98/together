/// @description Initialize player

#region animation
sprite_sheet = con_game_manager.player_sprite;
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


username = ""; // string
player_color = c_black; // string
hat = ""; // string
role = ""; // string

currentNearestObject = obj_interactable; // object
onObject = obj_interactable; // object

interactRange = 10; // int

tasks = []; // list, but fetches from hashtable in server
taskbar_x = 10;  // int
taskbar_y = 10;  // int
taskbar_max = 150; // int
taskbar_width = 118;  // int
taskbar_height = 22; // int
display_tasks = false; // bool

food_bar_x = 10; // int
food_bar_y = 40; // int
food_bar_width = 118; // int
food_bar_height = 22; // int
food_max = 10; // int
food = food_max; // int

water_bar_x = 10; // int
water_bar_y = 70; // int
water_bar_width = 118; // int
water_bar_height = 22; // int
water_max = 10; // int
water = water_max; // int

x = 0;
y = 0;
image_angle = 0;
time_since_hands_washed = 0; // double
mask_on = false; // bool
h_collide = 0;
v_collide = 0;
draw_set_font(Font1);

chat_color_1 = 0;
chat_color_2 = 0;
chat_color_3 = 0;

infection_level = 0; // int
slow = false;
nearsighted = false;
scrambled = 0; // int
dehydrated = false;
alarm[0] = room_speed * 60;

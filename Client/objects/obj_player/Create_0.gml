/// @description Initialize player

image_speed = 0.25; // float
username = ""; // string
walk_speed = 4; // int
food = 10; // int
water = 10; // int
infection_level = 0; // int
player_color = c_black; // string
hat = ""; // string
role = ""; // string
inventory = []; // list
tasks = []; // list, but fetches from hashtable in server
x = 0;
y = 0;
image_angle = 0;
time_since_hands_washed = 0; // double
mask_on = false; // bool
h_collide = 0;
v_collide = 0;

draw_set_font(Font1);

show_debug_message("USERNAME: " + username);
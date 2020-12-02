/// @description Initialize player

default_image_speed = 0.25; // float
image_speed = default_image_speed;

username = ""; // string
walk_speed = 4; // int
food = 10; // int
//food_obj = instance_create(0, 0, obj_food);
water = 10; // int
infection_level = 0; // int
player_color = c_black; // string
hat = ""; // string
role = ""; // string

inventory = ds_list_create(); // list
max_inventory = 3; // int
interactRange = 10; // int
showInventory = false; // bool
inventory_x = (global.cam_width/2)-75; // int
inventory_y = global.cam_height-48; // int

tasks = []; // list, but fetches from hashtable in server
taskbar_x = 10;  // int
taskbar_y = 10;  // int
taskbar_max = 100; // int
taskbar_width = 118;  // int
taskbar_height = 22; // int

x = 0;
y = 0;
image_angle = 0;
time_since_hands_washed = 0; // double
mask_on = false; // bool
h_collide = 0;
v_collide = 0;

draw_set_font(Font1);
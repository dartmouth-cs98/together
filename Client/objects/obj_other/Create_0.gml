/// @description Initialize other player sprite

image_speed = 0.4;
username = "";
infection_level = 0; // int
player_color = ds_map_find_value(color_map, colors.black); // string
hat = ""; // string
role = ""; // string

x = 0;
y = 0;
image_angle = 0;
time_since_hands_washed = 0; // double
mask_on = false; // bool

draw_set_font(Font1);
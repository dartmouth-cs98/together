/// @description Initialize inventory
// You can write your code in this editor

global.inventory = ds_list_create(); // list
global.max_inventory = 3; // int

// For selecting item in inventory
selected = 0;
itemSelected = undefined;

option = 0;

// For drawing options
_width = 50;
_height = 25;
_color = c_white;
_hover_color = c_ltgray;
_text_color = c_black;
_offset = 25;
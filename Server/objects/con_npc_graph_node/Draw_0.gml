/// @description [FOR TESTING, REMOVE] Draw a line to each neighbor node

draw_self();

w = 5;
draw_set_color(c_yellow);

for (var i = 0; i < ds_list_size(neighbors); i++) {
	var neighbor = ds_list_find_value(neighbors, i);
	draw_line_width(x, y, neighbor.x, neighbor.y, w);
}
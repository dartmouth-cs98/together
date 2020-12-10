/// @description Control character select

if (keyboard_check_pressed(global.key_right)) { column++; }
if (keyboard_check_pressed(global.key_left)) { column--; }
index = clamp(column, 0, num_columns);

if (keyboard_check_pressed(global.key_down)) { row++; }
if (keyboard_check_pressed(global.key_up)) { row--; }
index = clamp(row, 0, num_rows);
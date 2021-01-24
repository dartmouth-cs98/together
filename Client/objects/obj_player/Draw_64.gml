/// @description Draw taskbar
draw_sprite(spr_taskbar_border, 0, taskbar_x, taskbar_y);
draw_sprite_stretched(spr_taskbar, 0, taskbar_x, taskbar_y, (global.taskbar/taskbar_max) * taskbar_width, taskbar_height);
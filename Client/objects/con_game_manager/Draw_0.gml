/// @description Insert description here
// You can write your code in this editor

if (room != rm_main_menu) {
	exit;
}

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text(room_width/2, room_height/2, "Press Space to be a Gamer(tm)")

if(instance_find(obj_player, 0) != noone){
	draw_text(global.cam_X + 50, global.cam_Y, obj_player.food);
	draw_text(global.cam_X + 50, global.cam_Y + 50, obj_player.water);
}
//else{draw_text(100, 100, "waffle");}
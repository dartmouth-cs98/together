/// @description Insert description here
// You can write your code in this editor

switch(room){
	
	case rm_main_menu:

		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		draw_text(room_width/2, room_height/2, "Press Space to be a Gamer(tm)");
	
	case rm_client:
		
		if(instance_find(obj_player, 0) != noone){
			draw_text(global.cam_X + 40, global.cam_Y + 20, "Food: " + string(obj_player.food));
			draw_text(global.cam_X + 40, global.cam_Y + 35, "Water: " + string(obj_player.water));	
		}
		
	default:
	
}
/*
with (con_camera){
	if(instance_find(obj_player, 0) != noone){
		draw_text(global.cam_X + global.cam_width/2, global.cam_Y + global.cam_height/2, obj_player.food);
		draw_text(global.cam_X, global.cam_Y, obj_player.water);
	}
}
*/
//else{draw_text(100, 100, "waffle");}
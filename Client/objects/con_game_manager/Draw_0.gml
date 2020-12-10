/// @description Draw text depending on room & functionality

switch(room){
	
	case rm_main_menu:
		draw_set_colour(c_white);
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		draw_text_transformed(room_width/2, room_height/2, "Press Space to start", 5, 5, 0);
		break;
	
	case rm_client:
		if(instance_find(obj_player, 0) != noone){
		
			food_obj = instance_find(obj_food, 0);
			food_obj.x = global.cam_X + 20;
			food_obj.y = global.cam_Y + 40;
			draw_text(global.cam_X + 40, global.cam_Y + 65, "Water: " + string(obj_player.water));	
		}
		break;
		
	case rm_win_screen:
		draw_set_colour(c_white);
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		draw_text_transformed(room_width/2, room_height/2, "You win!", 3, 3, 0);
		break;
		
	default:
		break;
	
}
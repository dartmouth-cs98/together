/// @description Draw text depending on room & functionality

switch(room){
	
	case rm_main_menu:

		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		draw_text(room_width/2, room_height/2, "Press Space to be a Gamer(tm)");
		break;
	
	case rm_client:
		
		if(instance_find(obj_player, 0) != noone){
		
			food_obj = instance_find(obj_food, 0);
			food_obj.x = global.cam_X + 20;
			food_obj.y = global.cam_Y + 40;
			draw_text(global.cam_X + 40, global.cam_Y + 65, "Water: " + string(obj_player.water));	
		}
    break;
		
	default:
		break;
	
}
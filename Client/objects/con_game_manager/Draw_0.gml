/// @description Draw text depending on room & functionality

switch(room){
	
	case rm_main_menu:

		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		draw_text(room_width/2, room_height/2, "Press Space to be a Gamer(tm)");
		break;
	
	case rm_client:
		
		if(instance_find(obj_player, 0) != noone){
			draw_text(global.cam_X + 40, global.cam_Y + 50, "Food: " + string(obj_player.food));
			draw_text(global.cam_X + 40, global.cam_Y + 65, "Water: " + string(obj_player.water));	
		}
    
	    if (global.paused) {
	      // Draw pause message
	      draw_set_halign(fa_center);
	      draw_set_valign(fa_middle);
	      draw_set_color(c_white);
	      draw_text(global.cam_X + (global.cam_height/2), global.cam_Y + (global.cam_height/2), "Paused");
	    }
	    break;
		
	default:
		break;
	
}


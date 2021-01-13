/// @description Insert description here
// You can write your code in this editor

switch(room){
	
	case rm_client:
		
		#region Manage disease symptoms
		player = instance_find(obj_player, 0); 
		with(player){
			if (slow) walk_speed = 3;
			if (nearsighted){
				global.cam_width = 408;
				global.cam_height = 229.5;
			}
			if (dehydrated) water_max = 7;

			if (infection_level == 0){
				walk_speed = 4;
				global.cam_width = 544;
				global.cam_height = 306;
				slow = false;
				nearsighted = false;
				scrambled = 0;
				dehydrated = false;
			}
		}
		#endregion
		
		break;
}
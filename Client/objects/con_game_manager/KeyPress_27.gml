/// @description Open pause menu

if (room == rm_client) {
	if (!paused) {
		#region Store info about player so they remain visible while paused
		var player = instance_find(obj_player, 0);
		player_data[0] = player.sprite_index;
		player_data[1] = player.image_index;
		player_data[2] = player.x;
		player_data[3] = player.y;
		player_data[4] = player.image_xscale;
		player_data[5] = player.image_yscale;
		player_data[6] = player.image_angle;
		player_data[7] = player.image_blend;
		player_data[8] = player.image_alpha;
		#endregion
		
		instance_deactivate_object(obj_player);
		paused = true;
		
	} else {
		instance_activate_object(obj_player);
		paused = false;
		player_data = 0; // Clear out data from the array
	}
}
/// @description Start washing hands
if (is_washing == true) {
	if (counter > room_speed*5) {
		// Decrease player disease by 1
		obj_player.infection_level -= 1;
		obj_player.infection_level = max(obj_player.infection_level, 0); // So infection level doesn't drop below 0
		
		is_washing = false;
		counter = 0;
		scr_unpause();
	} else {
		counter += 1
	}
}
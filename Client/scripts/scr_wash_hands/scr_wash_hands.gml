/// @description Script for washing hands
function scr_wash_hands(object){
	with(obj_sink){
		if (just_washed == false) {
			scr_pause();
		
			// Set just_washed to true and set 60 sec cooldown
			just_washed = true;
			is_washing = true;
			alarm[0] = 60*room_speed;
			
			scr_create_text("Washing Hands");
		
		} else {
			scr_create_text("You have to wait before washing your hands again!");
		}
	}
}
/// @description Collision with milk

if (is_cooking == false) {
	// Check if egg is here also
	if place_meeting(x,y,obj_egg) {
		is_cooking = true;
		with(other){
			instance_destroy();
		}
		product = obj_cake;
	}
}
/// @description Collision with wheat

if (is_cooking == false) {
	is_cooking = true;
	with(other){
		instance_destroy();
	}
	
	product = obj_bread;
}
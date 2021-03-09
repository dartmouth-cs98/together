/// @description Oven step event

if (is_cooking == true) {
	if (counter > room_speed*10) {
		instance_create_layer(x, y+50, "Instances", product);
		is_cooking = false;
		product = undefined;
		counter = 0;
	} else {
		counter += 1
	}
}
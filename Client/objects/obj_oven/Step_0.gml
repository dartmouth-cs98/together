/// @description Oven step event

if (product != undefined) {
	if (counter > room_speed*10) {
		instance_create_layer(x, y+50, "Instances", product);
		product = undefined;
		counter = 0;
	} else {
		counter += 1
	}
}
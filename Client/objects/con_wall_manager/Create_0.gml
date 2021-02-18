/// @description Insert description here
// You can write your code in this editor

// Buildings size 150x150
x_pos_list = [210, 765, 1695, 1050, 1588];
y_pos_list = [495, 255, 675, 465, 42];

for (i = 0; i < array_length_1d(x_pos_list); i++){
			
	instance_create_layer(x_pos_list[i], y_pos_list[i], "Instances_Walls", obj_wall150x150);
}

// Buildings size 130x150
x_pos_list = [1405];
y_pos_list = [665];

for (i = 0; i < array_length_1d(x_pos_list); i++){
			
	instance_create_layer(x_pos_list[i], y_pos_list[i], "Instances_Walls", obj_wall130x150);
}

// Buildings size 100x125
x_pos_list = [317];
y_pos_list = [1185];

/*
for (i = 0; i < array_length_1d(x_pos_list); i++){
			
	instance_create_layer(x_pos_list[i], y_pos_list[i], "Instances_Walls", obj_wall100x125);
}
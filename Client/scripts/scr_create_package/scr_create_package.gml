/// @description Script for creating a new mail delivery task
function scr_create_package(x, y){
	instance_create_layer(x, y, "Instances", obj_package);
}
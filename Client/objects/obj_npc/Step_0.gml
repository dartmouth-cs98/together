/// @description Insert description here
// You can write your code in this editor

nearestObject = instance_nearest(x,y,obj_interactable);
if (distance_to_object(nearestObject) < interactRange){	
	nearestObject.contaminated = true;
}
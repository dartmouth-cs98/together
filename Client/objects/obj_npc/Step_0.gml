/// @description Insert description here
// You can write your code in this editor

nearestObject = instance_nearest(x,y,obj_interactable);
if (distance_to_object(nearestObject) < interactRange){	
	
	randomize();
	if (con_game_manager.npc_infection_level == 1){
		
		if (irandom(7) == 0) nearestObject.contaminated = true;
	}
	else if (con_game_manager.npc_infection_level == 2){
		if (irandom(5) == 0) nearestObject.contaminated = true;
	}
	else if (con_game_manager.npc_infection_level == 3){
		if (irandom(3) == 0) nearestObject.contaminated = true;
	}
	else if (con_game_manager.npc_infection_level == 4){
		if (irandom(1) == 0) nearestObject.contaminated = true;
	}
}
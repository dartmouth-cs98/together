/// @description Insert description here
// You can write your code in this editor

total_player_infect_level = 0;
for (i = 0; i < other_count; i++){
	
	if (instance_find(obj_other, i) != noone){
		total_player_infect_level += instance_find(obj_other, i).infection_level;
	}
}
if (instance_find(obj_player, 0) != noone){
	total_player_infect_level += obj_player.infection_level;
}
if (total_player_infect_level > 30){	
	room_goto(rm_lose_screen);
}
// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_doctor_heal(player){
	
	player.dehydrated = false;
	player.slow = false;
	player.nearsighted = false;
	player.scrambled = 0;
	player.infection_level = 0;
}
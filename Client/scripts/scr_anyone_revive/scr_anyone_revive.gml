// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_anyone_revive(player_down, player_up, food_amount, water_amount){
	
	player_down.food += food_amount;
	player_down.water += water_amount;
}
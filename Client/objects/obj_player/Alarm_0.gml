/// @description Insert description here
// You can write your code in this editor

food--;
water--;
if (food == 0 or water == 0){

	global.paused = true;
}

// If sick, choose a symptom at random
if (infection_level > 2){
	
	symptom = irandom(4);
	if (symptom == 1) dehydrated = true;
	//if (symptom == 2) nearsighted = true;
	if (symptom == 3) slow = true;
	if (symptom == 4) scrambled = irandom(2);
	
	infection_level++;
	if (symptom == 0){
		infection_level = 6;
		dehydrated = true;
		//nearsighted = true;
		slow = true;
		scrambled = irandom(2);
	}
}

else if (infection_level > 0){
	
	if (irandom(2) == 0) infection_level--;
	else{infection_level++;}
}
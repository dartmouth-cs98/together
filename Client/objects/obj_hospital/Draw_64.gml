/// @description Insert description here
// You can write your code in this editor

if (open and !finished and obj_player.role != "Doctor"){
	draw_rectangle_color(80, 30, 450, 250, c_black, c_black, c_black, c_black, false);
	draw_set_color(c_green);
	draw_set_halign(fa_left);
	if (a) draw_text(125, 50 + 16 * 0, "Blood Pressure: " + string(a_val));	
	if (b) draw_text(125, 50 + 16 * 1, "BMI: " + string(b_val));	
	if (c) draw_text(125, 50 + 16 * 2, "Benches Patient Can Press: " + string(c_val));	
	if (d) draw_text(125, 50 + 16 * 3, "Heart Rate: " + string(d_val));	
	if (e){
		if (obj_player.infection_level == 0) draw_text(125, 50 + 16 * 4, "Test Result: Negative");
		else if (obj_player.infection_level < 4) draw_text(125, 50 + 16 * 4, "Test Result: Positive");	
		else if (obj_player.infection_level < 7) draw_text(125, 50 + 16 * 4, "Test Result: Positive, Seek Medical Care");	
	}
}
else if (open and (arm_in or doctor_in)){
	//draw_rectangle_color(80, 30, 450, 250, c_white, c_white, c_white, c_white, false);
	if (arm_in){
		obj_arm.x = x - 150;
		obj_arm.y = y - 150;
	}
	if (true){ //(doctor_in){
		obj_syringe.x = x - 150;
		obj_syringe.y = y - 150;
	}
}
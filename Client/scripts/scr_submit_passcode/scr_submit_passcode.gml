// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_submit_passcode(){
	if (con_passcode.passcode == con_passcode.input) {
		show_debug_message("CORRECT!");
	} else {
		show_debug_message("WRONG!");
		con_passcode.input = "";
	}
}
// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_submit_passcode(){
	if (con_passcode.passcode == con_passcode.input) {
		scr_task_complete(5);
		show_message("CORRECT!");
		scr_open_close_passcode();
	} else {
		show_message("WRONG!");
	}
	con_passcode.input = "";
}
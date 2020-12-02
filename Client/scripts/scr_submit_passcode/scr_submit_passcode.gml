// @description Submit the input of the passcode.
// params = [object_id]
function scr_submit_passcode(params){
	if (con_passcode.passcode == con_passcode.input) {
		scr_task_complete(10);
		show_debug_message("CORRECT!");
		scr_open_close_passcode();
		instance_destroy(params[0]);	// Remove the passcode object that was just submitted.
	} else {
		show_debug_message("WRONG!");
	}
	con_passcode.input = "";
}
// @description Submit the input of the passcode.
// params = [object_id]
function scr_submit_passcode(params){
	if (con_passcode.passcode == con_passcode.input) {
		scr_task_complete(10);
		show_message("Correct! See if you can solve all 5.");
		scr_open_close_passcode(params[0]);
		instance_destroy(params[0]);	// Remove the passcode object that was just submitted.
	} else {
		show_message("Incorrect! Try again.");
	}
	con_passcode.input = "";
}
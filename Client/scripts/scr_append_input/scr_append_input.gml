///@description 

function scr_append_input(){
	if (string_length(con_passcode.input) < 5) {
		con_passcode.input += text;
		show_debug_message(con_passcode.input);
	}
}
///@description Remove last letter of the input passcode.
function scr_backspace(){
	if (string_length(con_passcode.input) > 0){
		con_passcode.input = string_delete(con_passcode.input, string_length(con_passcode.input), 1)
	}
}
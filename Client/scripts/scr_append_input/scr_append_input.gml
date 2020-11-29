///@description A script used for number buttons to add their value to the input.

function scr_append_input(){
	if (string_length(con_passcode.input) < 5) {
		con_passcode.input += text;
	}
}
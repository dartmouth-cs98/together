/// @description Detect chat messages

if (show_chat) {
	chat_text = keyboard_string;		// Built-in variable, keeps track of last 1024 chars
	
	if (string_length(chat_text) > 37){
		
		keyboard_string = string_copy(keyboard_string, 1, 37);
	}
}
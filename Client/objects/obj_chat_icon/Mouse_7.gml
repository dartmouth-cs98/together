/// @description Insert description here
// You can write your code in this editor

if (!(global.any_menu and !con_chat.show_chat)){ // Check if menu is open and that menu isn't chat
	
	if (!con_chat.show_chat and !global.any_menu){ // Check if chat is not open and menu is not open
		scr_pause();
		global.any_menu = true;
		con_chat.show_chat = true;
	}
	
	else{
		global.any_menu = false;
		scr_unpause();
		con_chat.show_chat = false;
	}
}
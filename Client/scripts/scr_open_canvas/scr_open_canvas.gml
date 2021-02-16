// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_open_canvas(object){

	with(object){

		if (!finished){
			if (!(global.any_menu and !open)){ // Check if menu is open and that menu isn't canvas
	
				if (!open and !global.any_menu){ // Check if canvas is not open and menu is not open
					scr_pause();
					global.any_menu = true;
					open = true;
				}
	
				else{
					global.any_menu = false;
					scr_unpause();
					open = false;
				}
			}
		}
	}
}
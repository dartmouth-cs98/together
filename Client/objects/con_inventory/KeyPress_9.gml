/// @description Toggle inventory
if ( !(global.any_menu and !global.inventory_menu )) {	
	if (!global.inventory_menu and !global.any_menu) {
		global.inventory_menu = true;
		global.any_menu = true;
		scr_pause();
	} else {
		global.inventory_menu = false;
		global.any_menu = false;
		itemSelected = undefined;

		scr_unpause();
	}
}
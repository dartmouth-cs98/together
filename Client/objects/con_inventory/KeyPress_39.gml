/// @description Move selected right
if (global.inventory_menu and (itemSelected == undefined)) {
	selected += 1;
	selected = clamp(selected, 0, global.max_inventory-1);
}
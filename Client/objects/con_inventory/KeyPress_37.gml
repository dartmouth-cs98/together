/// @description Move selected left
if (global.inventory_menu) {
	selected -= 1;
	selected = clamp(selected, 0, global.max_inventory-1);
}
///@description	Set up menu page based on arrays
function scr_create_menu_page(a1, a2, a3, a4, a5){
	var arg, i = 0;
	
	// Populate arg
	repeat(argument_count) {
		if (array_length_1d(argument[i]) == 0) {
			break;
		}
		arg[i] = argument[i];
		i++
	}
	
	// Creates a grid w/ 5 columns & "argument_count" rows
	var arg_len = array_length_1d(arg);
	var ds_grid_id = ds_grid_create(5, arg_len);
	
	// Populate grid
	i = 0;
	repeat(arg_len) {
		var array = arg[i];
		var array_len = array_length_1d(array);
		
		var column = 0;
		repeat(array_len) {
			ds_grid_set(ds_grid_id, column, i, array[column]);
			//ds_grid_id[# column, i] = array[column];
			column++;	
		}
		
		i++;
	}
	
	
	return ds_grid_id;
}
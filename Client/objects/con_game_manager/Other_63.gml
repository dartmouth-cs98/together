/// @description Get the input username & store it
// This event is required by get_string_async, and get_string_async is required by Mac

username = ds_map_find_value(async_load, "result");
if (string_length(username) > 12){
	username_copy = string_delete(username, 13, string_length(username) - 12);
	username = username_copy;
}
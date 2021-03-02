/// @description Destroy data structures when we end

ds_map_destroy(socket_list);
ds_map_destroy(socket_to_instanceid);
ds_map_destroy(color_map);
buffer_delete(server_buffer);
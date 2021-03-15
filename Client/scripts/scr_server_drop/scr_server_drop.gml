// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_server_drop(){
	// Remove item from inventory
	ds_list_delete(global.inventory, selected);
	
	itemSelected.x = obj_player.x;
	itemSelected.y = obj_player.y;
	
	buffer_seek(con_client.client_buffer, buffer_seek_start, 0);		// Go to start of buffer
	buffer_write(con_client.client_buffer, buffer_u8, network.item);	// ID

	buffer_write(con_client.client_buffer, buffer_u8, 0);			// Send action
	buffer_write(con_client.client_buffer, buffer_string, object_get_name(itemSelected.object_index));		// Send object_type
	buffer_write(con_client.client_buffer, buffer_u32, random_range(1000000, 9999999));
	buffer_write(con_client.client_buffer, buffer_s16, obj_player.x);
	buffer_write(con_client.client_buffer, buffer_s16, obj_player.y);
	
	instance_destroy(itemSelected);
	
	network_send_packet(con_client.client, con_client.client_buffer, buffer_tell(con_client.client_buffer));
	
	scr_create_text("Item dropped");
	itemSelected = undefined;
}
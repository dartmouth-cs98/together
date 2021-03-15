/// @description Script for picking up an object.

function scr_server_pickup(object){
	// Picks up object
	if(ds_list_size(global.inventory) < global.max_inventory){
		buffer_seek(con_client.client_buffer, buffer_seek_start, 0);		// Go to start of buffer
		buffer_write(con_client.client_buffer, buffer_u8, network.item);	// ID

		buffer_write(con_client.client_buffer, buffer_u8, 1);			// Send action
		buffer_write(con_client.client_buffer, buffer_string, object_get_name(object.object_index));		// Send object_type
		buffer_write(con_client.client_buffer, buffer_u32, object.object_id);
		
		temp = instance_create_layer(-100, -100, "Instances", object.object_index);
		with(temp) object_id = 1;
		ds_list_add(global.inventory, temp);
		
		network_send_packet(con_client.client, con_client.client_buffer, buffer_tell(con_client.client_buffer));
		
	} else {
		scr_create_text("Your inventory is full!");
	}
}
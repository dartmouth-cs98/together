/// @description TEMPORARY. FOR TESTING INCREASING TASK BAR

buffer_seek(con_client.client_buffer, buffer_seek_start, 0);		// Go to start of buffer
buffer_write(con_client.client_buffer, buffer_u8, network.task);	// ID

task_completion = 5;

buffer_write(con_client.client_buffer, buffer_u8, task_completion);		// Add to taskbar
network_send_packet(con_client.client, con_client.client_buffer, buffer_tell(con_client.client_buffer));

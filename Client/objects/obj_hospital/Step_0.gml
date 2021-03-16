/// @description Insert description here
// You can write your code in this editor

if (open){
	if (obj_player.role == "Doctor"){
		doctor_in = true;	
		buffer_seek(con_client.client_buffer, buffer_seek_start, 0);		// Go to start of buffer
		buffer_write(con_client.client_buffer, buffer_u8, network.vaccinate);
		buffer_write(con_client.client_buffer, buffer_u8, 1);
		network_send_packet(con_client.client, con_client.client_buffer, buffer_tell(con_client.client_buffer));
	}
	else if (finished and other_arm_in == false and obj_player.infection_level > 0){
		arm_in = true;
		buffer_seek(con_client.client_buffer, buffer_seek_start, 0);		// Go to start of buffer
		buffer_write(con_client.client_buffer, buffer_u8, network.vaccinate);
		buffer_write(con_client.client_buffer, buffer_u8, 2);
		network_send_packet(con_client.client, con_client.client_buffer, buffer_tell(con_client.client_buffer));
	}
	if (arm_in and doctor_in and obj_player.role != "Doctor"){
		obj_player.infection_level = 0;
		scr_create_text("You've been cured!");
		global.any_menu = false;
		scr_unpause();
		open = false;
		arm_in = false;
		buffer_seek(con_client.client_buffer, buffer_seek_start, 0);		// Go to start of buffer
		buffer_write(con_client.client_buffer, buffer_u8, network.vaccinate);
		buffer_write(con_client.client_buffer, buffer_u8, 4);
		network_send_packet(con_client.client, con_client.client_buffer, buffer_tell(con_client.client_buffer));	
	}
}
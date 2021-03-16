/// @description Insert description here
// You can write your code in this editor

if (open){
	scr_unpause();
	global.any_menu = false;
	open = false;
	if (obj_player.role == "Doctor" and doctor_in){
		obj_syringe.y = 4000;
		doctor_in = false;
		buffer_seek(con_client.client_buffer, buffer_seek_start, 0);		// Go to start of buffer
		buffer_write(con_client.client_buffer, buffer_u8, network.vaccinate);
		buffer_write(con_client.client_buffer, buffer_u8, 3);
		network_send_packet(con_client.client, con_client.client_buffer, buffer_tell(con_client.client_buffer));
	}
	else if (obj_player.role != "Doctor" and arm_in){
		obj_arm.y = 4000;
		arm_in = false;
		buffer_seek(con_client.client_buffer, buffer_seek_start, 0);		// Go to start of buffer
		buffer_write(con_client.client_buffer, buffer_u8, network.vaccinate);
		buffer_write(con_client.client_buffer, buffer_u8, 4);
		network_send_packet(con_client.client, con_client.client_buffer, buffer_tell(con_client.client_buffer));
	}
}
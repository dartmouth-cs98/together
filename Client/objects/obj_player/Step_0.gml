/// @description Every frame

#region Manage 8-directional movement, based on this video: https://www.youtube.com/watch?v=0-a0Fak7cjk

if (!global.paused) {
	h_input = keyboard_check(vk_right) - keyboard_check(vk_left);
	v_input = keyboard_check(vk_down) - keyboard_check(vk_up);
}

if (h_collide == -1 && h_input < 0) { h_input = 0; } // Left
else if (h_collide == 1 && h_input > 0) { h_input = 0; } // Right

if (v_collide == -1 && v_input < 0){ v_input = 0; } // Up
else if (v_collide == 1 && v_input > 0){ v_input = 0; } // Down

h_collide = 0;
v_collide = 0;

// Outer boundaries
if (h_input < 0 and x < 25){
	h_input = 0;
}
if (h_input > 0 and x > 2475){
	h_input = 0;
}
if (v_input < 0 and y < 25){
	v_input = 0;
}
if (v_input > 0 and y > 1475){
	v_input = 0;
}



buffer_seek(con_client.client_buffer, buffer_seek_start, 0);		// Go to start of buffer
buffer_write(con_client.client_buffer, buffer_u8, network.move);	// ID
buffer_write(con_client.client_buffer, buffer_s8, h_input);			// Horizontal input
buffer_write(con_client.client_buffer, buffer_s8, v_input);			// Vertical input
buffer_write(con_client.client_buffer, buffer_u8, walk_speed);		// Walk speed
network_send_packet(con_client.client, con_client.client_buffer, buffer_tell(con_client.client_buffer));
//show_debug_message("SEND: move: "+string(current_time));
  
#endregion

#region Manage Object interaction

nearestObject = instance_nearest(x,y,obj_interactable);
if(distance_to_object(nearestObject) < interactRange){
	if(keyboard_check_released(vk_space)){
		// Run object script
		script_execute(nearestObject.myscript, nearestObject);

		//show_debug_message("Object interact distance: " + string(distance_to_object(nearestObject)))
	}
	
	with(nearestObject){
		sprite_index = choose(object2);
	}
} else {
	with(nearestObject){
		sprite_index = choose(object1);
	}
}
#endregion
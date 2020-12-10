/// @description On space, switch rooms based on current room

switch (room) {
	case rm_main_menu:
		room_goto(rm_sprite_select);
		break;
	
	case rm_sprite_select:
		room_goto(rm_client);
		break;
		
	default:
		break;
}
/// @description Draw for instructions pages
draw_set_halign(fa_center);
if (page != 0) draw_text(20 ,global.cam_height/2, "<");
if (page != max_page) draw_text(global.cam_width - 20 ,global.cam_height/2, ">");

switch(page) {
	case 0:
		draw_set_halign(fa_left);
		draw_text(20, 20, "Press esc to go back to the main menu");

		draw_set_halign(fa_center);

		draw_text(global.cam_width/2, 70, "Welcome to Together!");
		draw_text(global.cam_width/2, 110, "A game where you work together with others");
		draw_text(global.cam_width/2, 130, "to try and complete all your tasks!");
		draw_text(global.cam_width/2, 170, "But watch out for the spreading disease!");
		draw_text(global.cam_width/2, 190, "Don't let the disease spread too much or you will lose.");

		draw_text(global.cam_width/2, global.cam_height - 40, "Use the arrow keys to navigate between pages");
		break;
		
	case 1:
		draw_set_halign(fa_center);
		draw_text(global.cam_width/2, 70, "Use the arrow keys to move around");
		
		draw_sprite(spr_bandana_purple_icon, 0, global.cam_width/2, global.cam_height/2 - 40);
		
		draw_text(global.cam_width/2, 230, "You can change this in the settings!");
		break;

	case 2:
		draw_text(global.cam_width/2, 50, "Everyone has their own role!");
		draw_text(global.cam_width/2, 70, "Each role has their own tasks");
		
		draw_text(global.cam_width/2, global.cam_height/2 - 40, "Farmer");
		draw_sprite(spr_bandana_purple_icon, 0, global.cam_width/2 - 10, global.cam_height/2);
		
		draw_text(global.cam_width/2, 230, "Press t to see your tasks");
		break;
		
	case 3:
		draw_text(global.cam_width/2, 50, "This is your task bar progress");
		draw_text(global.cam_width/2, 70, "Fill this up to win the game!");
		draw_sprite(spr_taskbar_border, 0, 200, 100);
		draw_sprite_stretched(spr_taskbar, 0, 200, 100, 50, 22);
		
		draw_text(global.cam_width/2, 160, "This is your food bar");
		draw_text(global.cam_width/2, 180, "Don't let this drop to zero!");
		draw_sprite(spr_taskbar_border, 0, 200, 210);
		draw_sprite_stretched(spr_food_bar, 0, 200, 210, 90, 22);
		break;
	
	case 4:
		draw_text(global.cam_width/2, 50, "Walk up to an object to interact with it!");
		draw_text(global.cam_width/2, 70, "Press space to pick up or interact!");
		
		draw_sprite(spr_bandana_purple_icon, 0, global.cam_width/2, global.cam_height/2 - 40);
		draw_sprite(spr_apple2, 0, global.cam_width/2 + 40, global.cam_height/2 - 10);
		break;
		
	case 5:
		draw_text(global.cam_width/2, 50, "Press tab to open your inventory");
		draw_text(global.cam_width/2, 70, "Use the arrow keys to select an object");
		
		draw_sprite(spr_inventory, 0, global.cam_width/2 - 50, global.cam_height/2);
		draw_sprite(spr_selector, 0, global.cam_width/2 - 25, global.cam_height/2 - 10);
		
		draw_text(global.cam_width/2, 230, "Press tab again to close your inventory");
		break;
		
	case 6:
		draw_text(global.cam_width/2, 50, "Click the chat icon to chat with other people");
		
		draw_set_colour(c_white);
		draw_rectangle(global.cam_width/2, global.cam_height/2 - 45, global.cam_width/2 + 45, global.cam_height/2, true);
		draw_sprite(chat_icon0, 0, global.cam_width/2, global.cam_height/2 - 50);
		
		draw_text(global.cam_width/2, 210, "You can also use a third party program to");
		draw_text(global.cam_width/2, 230, "simply speak with your friends");
		
}
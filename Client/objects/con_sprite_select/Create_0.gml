/// @description Set up sprite select menu

// Currently selected column & row
column = 0;
row = 0

num_columns = 5;
num_rows = 5;

#region Icons for display in each row

i_row_1 = [	spr_bandana_purple_icon,
			spr_bandana_red_icon,
			spr_cape_blue_icon,
			spr_cape_red_icon,
			spr_epaulets_icon];

i_row_2 = [	spr_green_hair_icon,
			spr_hat_red_icon,
			spr_knight_gray_icon,
			spr_knight_red_icon,
			spr_knight_red_mask_icon];
		
i_row_3 = [	spr_orc_brunette_icon,
			spr_orc_gray_icon,
			spr_orc_knight_icon,
			spr_orc_redhead_icon,
			spr_princess_red_icon];
		
i_row_4 = [	spr_purple_blond_icon,
			spr_purple_hooded_icon,
			spr_shirt_blue_icon,
			spr_shirt_green_icon,
			spr_shirt_red_icon];
		
i_row_5 = [	spr_skeleton_gray_icon,
			spr_skeleton_pink_icon,
			spr_witch_blue_icon,
			spr_witch_purple_icon,
			spr_witch_red_icon];

#endregion
icon_grid = scr_create_menu_page(i_row_1, i_row_2, i_row_3, i_row_4, i_row_5);

#region Sprite sheets

s_row_1 = [	spr_bandana_purple_sheet,
			spr_bandana_red_sheet,
			spr_cape_blue_sheet,
			spr_cape_red_sheet,
			spr_epaulets_sheet];

s_row_2 = [	spr_green_hair_sheet,
			spr_hat_red_sheet,
			spr_knight_gray_sheet,
			spr_knight_red_sheet,
			spr_knight_red_mask_sheet];
		
s_row_3 = [	spr_orc_brunette_sheet,
			spr_orc_gray_sheet,
			spr_orc_knight_sheet,
			spr_orc_redhead_sheet,
			spr_princess_red_sheet];
		
s_row_4 = [	spr_purple_blond_sheet,
			spr_purple_hooded_sheet,
			spr_shirt_blue_sheet,
			spr_shirt_green_sheet,
			spr_shirt_red_sheet];
		
s_row_5 = [	spr_skeleton_gray_sheet,
			spr_skeleton_pink_sheet,
			spr_witch_blue_sheet,
			spr_witch_purple_sheet,
			spr_witch_red_sheet];

#endregion
sprite_grid = scr_create_menu_page(s_row_1, s_row_2, s_row_3, s_row_4, s_row_5);

menu_sound = snd_Cursor01;
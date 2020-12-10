/// @description Set up sprite select menu
column = 0;
row = 0

num_columns = 5;
num_rows = 5;

num_sprites = num_rows * num_columns;

#region Sprites in each row

row_1 = [	spr_bandana_purple_icon,
			spr_bandana_red_icon,
			spr_cape_blue_icon,
			spr_cape_red_icon,
			spr_epilets_icon];

row_2 = [	spr_green_hair_icon,
			spr_hat_red_icon,
			spr_knight_gray_icon,
			spr_knight_red_icon,
			spr_knight_red_mask_icon];
		
row_3 =	[	spr_orc_brunette_icon,
			spr_orc_gray_icon,
			spr_orc_knight_icon,
			spr_orc_redhead_icon,
			spr_princess_red_icon];
		
row_4 = [	spr_purple_blond_icon,
			spr_purple_hooded_icon,
			spr_shirt_blue_icon,
			spr_shirt_green_icon,
			spr_shirt_red_icon];
		
row_5 = [	spr_skeleton_gray_icon,
			spr_skeleton_pink_icon,
			spr_witch_blue_icon,
			spr_witch_purple_icon,
			spr_witch_red_icon];

#endregion

sprite_grid = scr_create_menu_page(row_1, row_2, row_3, row_4, row_5);

names = [];
for (var i = 1; i < num_sprites; i++) {
	names[i-1] = string(i);
}


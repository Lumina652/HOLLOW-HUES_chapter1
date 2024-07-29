depth = -9999;

selected_item = -1;

//INTERACTION DELAY
pressed_interact_timer = 0;
pressed_interact_time = 10;

inv_item_step = -1;
inv_weapon_step = -1;
inv_armor_step = -1;
inv_key_step = -1;
menu_button = -1;
selected_menu = 0;
menu_button_pos = 0;
made_draw_menu = 0;

item_move_vertical = 0;

sep = 30;
screen_border_y = 10;
screen_border_x = 80;
next_column_offset = 140;

//ui - ITEMS
bg_width = 32;
bg2_width = 3.5
bg_height = 11;
bg_img = 0; //frame of the pause box 
bg_speed = 6 / room_speed; //how fast the pause box 
bg_sprite = spr_text_box_inv;
other_bg_sprite = spr_text_box_inv;
other_bg_sprite_stats = spr_text_box_inv;
other_frame_sprite = spr_inv_frame;
other_frame_sprite_stats = spr_inv_frame;
frame_sprite = spr_inv_frame;

name_bg_width = 5;

description_bg_width = 10.5;
description_bg_height = 2.5;

button_selected = spr_text_box_selected;
button_unselected = spr_text_box_sal;
button_bg_item = button_unselected;
button_bg_weapon = button_unselected;
button_bg_armor = button_unselected;
button_bg_key = button_unselected;
button_width = 2.5;
button_height = 1.5;
button_x = 10 + camera_get_view_x(view_camera[0]);
button_item_y = 20 + camera_get_view_y(view_camera[0]);
button_weapon_y = button_item_y + 50;
button_armor_y = button_item_y + 100;
button_key_y = button_item_y + 150;

button_item_icon = spr_inv_icon_item;
button_weapon_icon = spr_inv_icon_weapon;
button_armor_icon = spr_inv_icon_armor;
button_key_icon = spr_inv_icon_key;

portrait_hazel = spr_text_box_hazel;
portrait_rose = spr_text_box_rose;

portrait_sal_sprite = spr_inv_portrait_sal;
portrait_hazel_sprite = spr_inv_portrait_hazel;
portrait_rose_sprite = spr_inv_portrait_rose;

//portraits = 1
portrait_sal_x_1 = 440 + camera_get_view_x(view_camera[0]);
sal_x_1 = 452 + camera_get_view_x(view_camera[0]);
portrait_people_y = 163 + camera_get_view_y(view_camera[0]);

//portraits = 2
portrait_sal_x_2 = 420 + camera_get_view_x(view_camera[0]);
portrait_other_x_2 = 480 + camera_get_view_x(view_camera[0]);
sal_x_2 = 432 + camera_get_view_x(view_camera[0]);
rose_x_2 = 492 + camera_get_view_x(view_camera[0]);

//portraits = 3
portrait_sal_x_3 = 380 + camera_get_view_x(view_camera[0]);
portrait_other_x_3 = 440 + camera_get_view_x(view_camera[0]);
portrait_other2_x_3 = 500 + camera_get_view_x(view_camera[0]);
sal_x_3 = 392 + camera_get_view_x(view_camera[0]);
rose_x_3 = 452 + camera_get_view_x(view_camera[0]);
hazel_x_3 = 512 + camera_get_view_x(view_camera[0]);

portrait_y = 160 + camera_get_view_y(view_camera[0]);
portrait_scale = 2.5;


item_selection_frame_spr = spr_inv_frame_selected;
item_selection_frame_x = 0;
item_selection_frame_y = 0;

weapon_selection_frame_x = 0;
weapon_selection_frame_y = 0;
armor_selection_frame_x = 0;
armor_selection_frame_y = 0;
key_selection_frame_x = 0;
key_selection_frame_y = 0;

party_select_inv = -1;
party_select_frame_alpha = 0;
party_select_frame_x = 0;

picking_item_for_party = 0;
picking_weapon_for_party = 0;
picking_armor_for_party = 0;
picked_item = 0;
picked_weapon = 0;
picked_armor = 0;


//WEAPON ICONS FOR PORTRAITS
sal_weapon_x_1 = 440;
sal_weapon_x_2 = 420;
sal_weapon_x_3 = 380;

armor_offset_x = 30;

rose_weapon_x_2 = 480;
rose_weapon_x_3 = 440;

hazel_weapon_x_3 = 500;

weapon_icon_y = 190;


//STATS
//portraits = 1
stats_portrait_sal_x = 80 + camera_get_view_x(view_camera[0]);
stats_sal_x = 92 + camera_get_view_x(view_camera[0]);
stats_sal_y = 13 + camera_get_view_y(view_camera[0]);
stats_portrait_sal_y = 10 + camera_get_view_y(view_camera[0]);

//portraits = 2
stats_portrait_rose_x = 80 + camera_get_view_x(view_camera[0]);
stats_rose_x = 92 + camera_get_view_x(view_camera[0]);
stats_rose_y = 83 + camera_get_view_y(view_camera[0]);
stats_portrait_rose_y = 80 + camera_get_view_y(view_camera[0]);

//portraits = 3
stats_portrait_hazel_x = 80 + camera_get_view_x(view_camera[0]);
stats_hazel_x = 92 + camera_get_view_x(view_camera[0]);
stats_hazel_y = 153 + camera_get_view_y(view_camera[0]);
stats_portrait_hazel_y = 150 + camera_get_view_y(view_camera[0]);

//STATS BARS - RIMS
rim_sprite_bars = spr_inv_frame;
rim_width = 5.7;
rim_height = 0.7;
rim_x = 175 + camera_get_view_x(view_camera[0]);

rim_hp_sal_y = 8 + camera_get_view_y(view_camera[0]);
rim_mana_sal_y = 28 + camera_get_view_y(view_camera[0]);

rim_hp_rose_y = 78 + camera_get_view_y(view_camera[0]);
rim_mana_rose_y = 98 + camera_get_view_y(view_camera[0]);

rim_hp_hazel_y = 148 + camera_get_view_y(view_camera[0]);
rim_mana_hazel_y = 168 + camera_get_view_y(view_camera[0]);

//STATS BARS - HP
hp_sprite = spr_health;
hp_width = 110;
hp_x = 177 + camera_get_view_x(view_camera[0]);

hp_sal_y = 10 + camera_get_view_y(view_camera[0]);

hp_rose_y = 80 + camera_get_view_y(view_camera[0]);

hp_hazel_y = 150 + camera_get_view_y(view_camera[0]);

//STATS BARS - MANA
mana_sprite = spr_mana;
mana_width = 110;
mana_x = 177 + camera_get_view_x(view_camera[0]);

mana_sal_y = 30 + camera_get_view_y(view_camera[0]);

mana_rose_y = 100 + camera_get_view_y(view_camera[0]);

mana_hazel_y = 170 + camera_get_view_y(view_camera[0]);

//WEAPON ICONS FOR STATS PORTRAITS
stats_sal_weapon_y = 40;

stats_rose_weapon_y = 110;

stats_hazel_weapon_y = 180;

stats_weapon_icon_x = 80;

//ATTACK AND DEFENSE MENU
attdef_sal_x = 133 + camera_get_view_x(view_camera[0]);
attdef_sal_y = 10 + camera_get_view_y(view_camera[0]);
attdef_sal_width = 1.7;
attdef_sal_height = 2.5;

attdef_sal_attack_x = 142;
attdef_sal_attack_y = 14;
attdef_sal_attack_scale = 0.7;
attdef_sal_attack_val_x = 144;
attdef_sal_attack_val_y = 24;
attdef_sal_defense_y = 38;
attdef_sal_defense_val_y = 48;

attdef_rose_y = 80 + camera_get_view_y(view_camera[0]);
attdef_rose_attack_y = 84;
attdef_rose_attack_val_y = 94;
attdef_rose_defense_y = 108;
attdef_rose_defense_val_y = 118;

attdef_hazel_y = 150 + camera_get_view_y(view_camera[0]);
attdef_hazel_attack_y = 154;
attdef_hazel_attack_val_y = 164;
attdef_hazel_defense_y = 178;
attdef_hazel_defense_val_y = 188;

//HP AND MANA TEXT
// "/"
stats_slash_x = 307;
stats_slash_w = 13;
stats_slash_sal_y = 10;
stats_slash_mana_offset = 20;
stats_slash_rose_y = 80;
stats_slash_hazel_y = 150;

//MAX COUNTER
stats_maxcounter_x = 313;
stats_maxcounter_w = 25;

//CURRENT COUNTER
stats_currentcounter_x = 290;
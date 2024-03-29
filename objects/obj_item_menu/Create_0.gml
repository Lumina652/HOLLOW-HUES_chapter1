depth = -9999;

selected_item = -1;

inv_item_step = -1;
inv_weapon_step = -1;
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
other_frame_sprite = spr_inv_frame;
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

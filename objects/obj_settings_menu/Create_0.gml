depth = -99999;
depth_text = depth;

//settingsbox VARIABLES
settingsbox_width = 30
settingsbox_height = 22;
settingsbox_x_offset = 20; //how much to move from 0
settingsbox_y_offset = 20; //how much to move from 0
settingsbox_x = camera_get_view_x(view_camera[0]) + settingsbox_x_offset;
settingsbox_y = camera_get_view_y(view_camera[0]) + settingsbox_y_offset;
settingsbox_img = 0; //frame of the pause box 
settingsbox_speed = 6 / room_speed; //how fast the pause box 
settingsbox_sprite = spr_text_box_inv;

//OVERLAY VARIABLES
pauseoverlay_sprite = spr_ocean_overlay2;
pauseoverlay_x = camera_get_view_x(view_camera[0]);
pauseoverlay_y = camera_get_view_y(view_camera[0]);
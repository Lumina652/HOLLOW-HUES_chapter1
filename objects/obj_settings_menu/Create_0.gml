depth = -99999;
depth_text = depth;

instance_deactivate_all(true);
instance_activate_object(obj_mouse);

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

//TEXT

//SETTINGS
settings_settings_x_offset = 320;
settings_settings_y_offset = 40;

//VOLUME
settings_volume_x_offset = 110;
settings_volume_y_offset = 120;

settings_volume_slider_x = 20;
settings_volume_slider_y_1 = 160;
settings_volume_slider_y_2 = 200;
settings_volume_slider_y_3 = 240;
settings_volume_slider_y_4 = 280;
settings_volume_slider_y_5 = 320;
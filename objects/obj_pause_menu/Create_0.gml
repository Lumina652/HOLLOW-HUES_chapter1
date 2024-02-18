depth = -99999;
depth_text = depth;

//PAUSEBOX VARIABLES
pausebox_width = 320;
pausebox_height = 360;
pausebox_x_offset = 160; //how much to move from 0
pausebox_y_offset = 60; //how much to move from 0
pausebox_x = camera_get_view_x(view_camera[0]) + pausebox_x_offset;
pausebox_y = camera_get_view_y(view_camera[0]) + pausebox_y_offset;
pausebox_img = 0; //frame of the pause box 
pausebox_speed = 6 / room_speed; //how fast the pause box 
pausebox_sprite = spr_text_box_sal;

//OVERLAY VARIABLES
pauseoverlay_sprite = spr_ocean_overlay2;
pauseoverlay_x = camera_get_view_x(view_camera[0]);
pauseoverlay_y = camera_get_view_y(view_camera[0]);

//PAUSE OPTIONS
resume_x = camera_get_view_x(view_camera[0]);
resume_y = camera_get_view_y(view_camera[0]);
resume_x_offset = 320;
resume_y_offset = 220;

settings_x = camera_get_view_x(view_camera[0]);
settings_y = camera_get_view_y(view_camera[0]);
settings_x_offset = 320;
settings_y_offset = 260;

inventory_x = camera_get_view_x(view_camera[0]);
inventory_y = camera_get_view_y(view_camera[0]);
inventory_x_offset = 320;
inventory_y_offset = 300;

quit_x = camera_get_view_x(view_camera[0]);
quit_y = camera_get_view_y(view_camera[0]);
quit_x_offset = 320;
quit_y_offset = 340;

//PAUSED TEXT
pausedtext_x = camera_get_view_x(view_camera[0]);
pausedtext_y = camera_get_view_y(view_camera[0]);
pausedtext_x_offset = 320;
pausedtext_y_offset = 20;
pausedtext_string = "PAUSED";

//PICKING
pick_x = camera_get_view_x(view_camera[0]);
pick_y = camera_get_view_y(view_camera[0]);
pick_x_offset = 180
pick_y_offset = 240;
pick_y_offset_resume = 240
pick_y_offset_settings = 280;
pick_y_offset_inventory = 320;
pick_y_offset_quit = 360;
option_number = 4;
option_pos = 0
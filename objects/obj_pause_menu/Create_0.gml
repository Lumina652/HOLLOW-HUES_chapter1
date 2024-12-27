depth = -99999;
depth_text = depth;
instance_deactivate_all(true);

#region VARIABLES
//PAUSEBOX VARIABLES
pausebox_width = 320;
pausebox_height = 360;
pausebox_x_offset = 160; //how much to move from 0
pausebox_y_offset = 60; //how much to move from 0
pausebox_x = 0 + pausebox_x_offset;
pausebox_y = 0 + pausebox_y_offset;
pausebox_img = 0; //frame of the pause box 
pausebox_speed = 6 / room_speed; //how fast the pause box 
pausebox_sprite = spr_text_box_inv;

//OVERLAY VARIABLES
pauseoverlay_sprite = spr_ocean_overlay2;
pauseoverlay_x = 0
pauseoverlay_y = 0

//PAUSE OPTIONS
resume_x = 0
resume_y = 0
resume_x_offset = 320;
resume_y_offset = 220;

settings_x = 0
settings_y = 0
settings_x_offset = 320;
settings_y_offset = 260;

save_x = 0
save_y = 0
save_x_offset = 320;
save_y_offset = 300;

quit_x = 0
quit_y = 0
quit_x_offset = 320;
quit_y_offset = 340;

//PAUSED TEXT
pausedtext_x = 0
pausedtext_y = 0
pausedtext_x_offset = 320;
pausedtext_y_offset = 20;
pausedtext_string = "PAUSED";

//PICKING
pick_x = 0
pick_y = 0
pick_x_offset = 180
pick_y_offset = 240;
pick_y_offset_resume = 240
pick_y_offset_settings = 280;
pick_y_offset_save = 320;
pick_y_offset_quit = 360;
option_number = 4;
option_pos = 0
#endregion

//MUSIC

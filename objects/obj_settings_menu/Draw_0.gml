#region VARIABLES
scr_draw_set_text(c_white, global.font_main, fa_center, fa_top);
var _x = camera_get_view_x(view_camera[0]);
var _y = camera_get_view_y(view_camera[0]);
#endregion

#region DRAW THE DARK OVERLAY
draw_sprite_ext(pauseoverlay_sprite, 0, pauseoverlay_x, pauseoverlay_y, 1, 1, 0, c_white, 0.5);
#endregion

#region DRAW THE PAUSEBOX
settingsbox_img += settingsbox_speed; //make the animation run
draw_sprite_ext(settingsbox_sprite, settingsbox_img, settingsbox_x, settingsbox_y, settingsbox_width, settingsbox_height, 0, c_white, 1);
#endregion

//OPTIONS
//volume
draw_text_transformed(_x + settings_settings_x_offset, _y + settings_settings_y_offset, "SETTINGS", 2, 2, 0);
//settings
draw_text(_x + settings_volume_x_offset, _y + settings_volume_y_offset, "VOLUME");
//var _slider_master = instance_create_depth(_x + settings_volume_slider_x, _y + settings_volume_slider_y_1, depth-1, obj_slider);
//var _slider_music = instance_create_depth(_x + settings_volume_slider_x, _y + settings_volume_slider_y_2, depth-1, obj_slider);
//var _slider_ambience = instance_create_depth(_x + settings_volume_slider_x, _y + settings_volume_slider_y_3, depth-1, obj_slider);
//var _slider_sound = instance_create_depth(_x + settings_volume_slider_x, _y + settings_volume_slider_y_4, depth-1, obj_slider);
//var _slider_talk = instance_create_depth(_x + settings_volume_slider_x, _y + settings_volume_slider_y_5, depth-1, obj_slider);

if (keyboard_check_pressed(global.controls_esc)) {
	instance_activate_object(obj_pause_menu);
	instance_destroy();	
}

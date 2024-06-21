#region VARIABLES
draw_set_font(global.font_pause);
draw_set_valign(fa_top);
draw_set_halign(fa_center);
#endregion

#region DRAW THE DARK OVERLAY
draw_sprite_ext(pauseoverlay_sprite, 0, pauseoverlay_x, pauseoverlay_y, 1, 1, 0, c_white, 0.5);
#endregion

#region DRAW THE PAUSEBOX
settingsbox_img += settingsbox_speed; //make the animation run
draw_sprite_ext(settingsbox_sprite, settingsbox_img, settingsbox_x, settingsbox_y, settingsbox_width, settingsbox_height, 0, c_white, 1);
#endregion

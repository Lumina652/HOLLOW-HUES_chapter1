var _bgx = camera_get_view_x(view_camera[0]);
var _bgy = camera_get_view_y(view_camera[0]);

#region VARIABLES
draw_set_font(global.font_main);
draw_set_valign(fa_top);
draw_set_halign(fa_center);


#endregion
#region DRAW THE DARK OVERLAY
draw_sprite_ext(pauseoverlay_sprite, 0, pauseoverlay_x + _bgx, pauseoverlay_y + _bgy, 1, 1, 0, c_white, 0.5);
#endregion
#region DRAW THE PAUSEBOX
pausebox_img += pausebox_speed; //make the animation run
draw_sprite_ext(pausebox_sprite, pausebox_img, pausebox_x + _bgx, pausebox_y + _bgy, 16, 18, 0, c_white, 1);
#endregion
#region DRAW THE OPTIONS
//pause text
draw_text_transformed_color(pausedtext_x + pausedtext_x_offset + _bgx, pausedtext_y + pausedtext_y_offset + _bgy, pausedtext_string, 2, 2, 0, c_white, c_white, c_white, c_white, 1);
//resume
draw_text_color(resume_x + resume_x_offset + _bgx, resume_y + resume_y_offset + _bgy, "RESUME", c_white, c_white, c_white, c_white, 1);
//settings
draw_text_color(settings_x + settings_x_offset + _bgx, settings_y + settings_y_offset + _bgy, "SETTINGS", c_white, c_white, c_white, c_white, 1);
//save
draw_text_color(save_x + save_x_offset + _bgx, save_y + save_y_offset + _bgy, "SAVE & LOAD", c_white, c_white, c_white, c_white, 1);
//quit game
draw_text_color(quit_x + quit_x_offset + _bgx, quit_y + quit_y_offset + _bgy, "QUIT GAME", c_white, c_white, c_white, c_white, 1);
//option pick
draw_sprite_ext(spr_pause_choose, 0, pick_x + pick_x_offset + _bgx, pick_y + pick_y_offset + _bgy, 14, 0.5, 0, c_white, 1);


#endregion

#region PICKING THE OPTIONS
//option selection
option_pos += keyboard_check_pressed(global.controls_down) - keyboard_check_pressed(global.controls_up);
option_pos = clamp(option_pos, 0, option_number - 1);

//option pick sound
if (keyboard_check_pressed(global.controls_down)) || (keyboard_check_pressed(global.controls_up)) {
	audio_play_sound(snd_option_pick, 2, false, global.sound_volume * global.master_volume);	
}

//option position
switch (option_pos) {
	case 0:
		pick_y_offset = pick_y_offset_resume;
		break;
	case 1:
		pick_y_offset = pick_y_offset_settings;
		break;
	case 2:
		pick_y_offset = pick_y_offset_save;
		break;
	case 3:
		pick_y_offset = pick_y_offset_quit;
		break;
}
	
//doing option stuff
if (keyboard_check_pressed(global.controls_interact)) || (keyboard_check_pressed(vk_space)) {
	switch (option_pos) {
		case 0:
			//resume game
			instance_activate_all();
			scr_resume_game();
			break;
		case 1:
			//instance_create_depth(0, 0, -99999, obj_settings_menu);
			break;
		case 2:
			//save stuff
			break;
		case 3:
			//quit game stuff
			game_end();
			break;
	}
}
#endregion
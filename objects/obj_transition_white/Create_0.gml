/// @description Size var's and mode setup

w = display_get_gui_width();
h = display_get_gui_height();

enum TRANS_MODE_WHITE {
	OFF,
	NEXT,
	GOTO,
	RESTART,
	INTRO
}


mode = TRANS_MODE_WHITE.INTRO;
style = TRANS_STYLE.WHITEFADE;
percent = 1;
target = room;
percent_target = 1.15;

white_alpha = 0;
white_duration = audio_sound_length(msc_rise) * room_speed;
white_stop = 1;
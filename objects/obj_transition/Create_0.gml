/// @description Size var's and mode setup

w = display_get_gui_width();
h = display_get_gui_height();

enum TRANS_MODE {
	OFF,
	NEXT,
	GOTO,
	RESTART,
	INTRO
}

enum TRANS_STYLE {
	BLACKFADE,
	WHITEFADE
}
mode = TRANS_MODE.INTRO;
style = TRANS_STYLE.BLACKFADE;
percent = 1;
target = room;
percent_target = 1.15;

//white_alpha = 0;
//white_duration = audio_sound_length(msc_rising_up) * room_speed;
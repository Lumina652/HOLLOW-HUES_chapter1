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
percent = 1;
target = room;
percent_target = 6.86 * room_speed;
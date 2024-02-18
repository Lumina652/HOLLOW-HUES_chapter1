pause_music = -1;
enum ROOM_MUSIC {
	OCEAN,
	MALACHI_BOSS,
	RISING_UP,
	SILENT,
	UNDERWATER
}

switch (current_music) {
	case ROOM_MUSIC.OCEAN:
		audio_stop_all();
		audio_play_sound(msc_malachi_theme, 1000, true);
		pause_music = 0;
		break;
	case ROOM_MUSIC.MALACHI_BOSS:
		audio_stop_all();
		audio_play_sound(msc_test, 1000, true);
		pause_music = 0;
		break;
	case ROOM_MUSIC.RISING_UP:
		audio_stop_all();
		audio_play_sound(msc_rising_up, 1000, false);
		pause_music = -1;
		break;
	case ROOM_MUSIC.UNDERWATER:
		audio_stop_all();
		audio_play_sound(msc_underwater, 1000, false);
		pause_music = -1;
		break;
	case ROOM_MUSIC.SILENT:
		audio_stop_all();
		pause_music = -1;
}
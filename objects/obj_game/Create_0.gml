scr_macros();
isPaused = false;
global.chapter = -1;
randomise();

var w = window_get_width();
var h = window_get_height();

window_set_size(w * 2, h * 2);

room_goto_next();
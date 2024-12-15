scr_macros();
isPaused = false;
global.chapter = -1;
randomise();

var _w = window_get_width();
var _h = window_get_height();

var _x = display_get_width();
var _y = display_get_height();

window_set_size(_w*2, _h*2);

room_goto_next();
/// @description Draw black bars
if (mode != TRANS_MODE.OFF) {
	draw_sprite_ext(spr_test, 0, 0, 0, w, h, 0, c_black, image_alpha * percent);	
}

//draw_set_color(c_white);
//dddddraw_text(50, 50, string(percent));
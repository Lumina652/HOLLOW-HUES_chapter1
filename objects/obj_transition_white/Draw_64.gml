/// @description Draw black bars
if (mode != TRANS_MODE_WHITE.OFF) {
	draw_sprite_ext(spr_test_white, 0, 0, 0, w, h, 0, c_white, image_alpha * percent);	
}

//draw_set_color(c_white);
//dddddraw_text(50, 50, string(percent));
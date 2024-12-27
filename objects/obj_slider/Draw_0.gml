//frame
draw_self();

//slider value
draw_sprite_ext(spr_slider, 0, x + 2, y + 2, slider_value, 1.9, 0, c_white, 1);

//selector
draw_sprite_ext(spr_slider_selector, 0, x + slider_value + 2, y + 2, 1.5, 1, 0, c_white, 0.9);

//text
//scr_draw_set_text(c_white, global.font_main, fa_center, fa_top);
//draw_text(x + (x/2), y, string(drawn_slider_value));
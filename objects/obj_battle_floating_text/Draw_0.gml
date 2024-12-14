scr_draw_set_text(c_black, global.font_main, fa_center, fa_middle);
draw_set_alpha(image_alpha);
draw_text(x+1, y, text);
draw_text(x-1, y, text);
draw_text(x, y+1, text);
draw_text(x, y-1, text);
draw_set_color(col);
draw_text(x,y,text);
draw_set_alpha(1.0);
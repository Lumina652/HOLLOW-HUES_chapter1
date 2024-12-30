img += ispeed;
draw_sprite_stretched(spr_text_box_inv, ispeed, x,y,width_full,height_full);
scr_draw_set_text(c_white, global.font_main, fa_left, fa_top);

var _desc = !(description == -1);
var _scroll_push = max(0, hover - (visible_options_max - 1));

for (var i = 0; i < (visible_options_max + _desc); i++) {
	if (i >= array_length(options)) break;
	draw_set_color(c_white);
	if (i == 0) && (_desc) {
		draw_text(x + xymargin, y + xymargin, description);	
	}
	else {
		var _option_to_show = i - _desc  + _scroll_push;
		var _str = options[_option_to_show][0];
		if (hover == _option_to_show - _desc) {
			draw_set_color(c_yellow);
		}
		if (options[_option_to_show][3] == false) draw_set_color(c_gray);
		draw_text(x + xymargin, y + xymargin + i * height_line, _str); 
	}
}

//selector sprite
draw_sprite(spr_arrow_left_sal, 0, x+xymargin + 2, y+xymargin + ((hover - _scroll_push) * height_line) + 7);
if (visible_options_max < array_length(options)) && (hover < array_length(options) - 1) {
	draw_sprite(spr_arrow_down_sal, 0, x+width_full * 0.5, y+height_full - 7);	
}
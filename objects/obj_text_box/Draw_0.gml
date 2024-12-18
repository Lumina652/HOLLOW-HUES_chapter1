#region more parameters
textbox_x = camera_get_view_x(view_camera[0]);
textbox_y = camera_get_view_y(view_camera[0]) + 320;

accept_key = keyboard_check_pressed(global.controls_interact);

#endregion

#region setup

if (setup == false) {
	setup = true;
	draw_set_font(global.font_main);
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
	
	//loop through the pages
	for (var p = 0; p < page_number; p++) {
		text_length[p] = string_length(text[p]);
		
		//left
		text_x_offset[p] = 180;
		portrait_x_offset[p] = 20;
		
		//right
		if (speaker_side[p] == -1) {
			text_x_offset[p] = 20;
			portrait_x_offset[p] = 480;
		}
		
		//no speaker (narrator)
		if (speaker_sprite[p] == noone) {
			text_x_offset[p] = 100;
		}
		
		for (var c = 0; c < text_length[p]; c++) {
			var _char_pos = c + 1;
			char[c, p] = string_char_at(text[p], _char_pos);
			var _text_up_to_char = string_copy(text[p], 1, _char_pos);
			var _current_text_w = string_width(_text_up_to_char) - string_width(char[c, p]);
			
			if (char[c, p] == " ") {
				last_free_space = _char_pos + 1;	
			}
			if (_current_text_w - line_break_offset[p] > line_width) || (char[c, p] = "\n") {
				line_break_pos[line_break_num[p], p] = last_free_space;
				line_break_num[p] ++;
				var _text_up_to_last_space = string_copy(text[p], 1, last_free_space);
				var _last_free_space_string = string_char_at(text[p], last_free_space);
				line_break_offset[p] = string_width(_text_up_to_last_space) - string_width(_last_free_space_string);
			}
		}
		for (var c = 0; c < text_length[p]; c++) {
			var _char_pos = c + 1;
			var _text_x = textbox_x + text_x_offset[p] + border;
			var _text_y = textbox_y + border;
			var _text_up_to_char = string_copy(text[p], 1, _char_pos);
			var _current_text_w = string_width(_text_up_to_char) - string_width(char[c, p]);
			var _text_line = 0;
			
			for (var lb = 0; lb < line_break_num[p]; lb++) {
				if (_char_pos >= line_break_pos[lb, p]) {
					var _str_copy = string_copy(text[p], line_break_pos[lb, p], _char_pos - line_break_pos[lb, p]);
					_current_text_w = string_width(_str_copy);
					_text_line = lb + 1;
				}
			}
			char_x[c, p] = _text_x + _current_text_w;
			char_y[c, p] = _text_y + _text_line * line_sep;
		}
	}
}

#endregion

#region typing the text

if (text_pause_timer <= 0) {
	if (draw_char < text_length[page]) {
		draw_char += text_spd;
		draw_char = clamp(draw_char, 0, text_length[page]);
		var _check_char = string_char_at(text[page], draw_char);
		if (_check_char == ".") || (_check_char == ",") || (_check_char == "?") || (_check_char == "!") {
			text_pause_timer = text_pause_time;	
			//if (!audio_play_sound(snd[page], 8, false)) {
				//audio_play_sound(snd[page], 8, false);
			//}
		}
		else {
			if (snd_count < snd_delay) {
				snd_count++;
			}
			else {
				snd_count = 0;
				audio_play_sound(snd[page], 8, false);
			}
		}
	}
}
else {
	text_pause_timer --;
}


#endregion

#region ----------go through pages ----------
if (instance_exists(obj_battle)) {
	if (accept_key) {
		if (draw_char == text_length[page]) {
			if (page < page_number - 1) {
				page++;
				draw_char = 0;
			}
			else {
				with (obj_battle) {
					battle_state = battle_state_select_action;	
				}
				instance_destroy();
			}
		}
	}
}


if (instance_exists(obj_item_menu)) {
	if (accept_key) && (obj_item_menu.pressed_interact_timer == 0) {
		if (draw_char == text_length[page]) {
			if (page < page_number - 1) {
				page++;
				draw_char = 0;
			}
			else {
				//link text for options
				if (option_number > 0) {
					scr_create_textbox(option_link_id[option_pos]);	
				}
			
				instance_destroy();
			}
		}
		else {
			draw_char = text_length[page];
		}
	}
}
if (accept_key) && (!instance_exists(obj_battle)) && (!instance_exists(obj_item_menu)) {
		if (draw_char == text_length[page]) {
			if (page < page_number - 1) {
				page++;
				draw_char = 0;
			}
			else {
				//link text for options
				if (option_number > 0) {
					scr_create_textbox(option_link_id[option_pos]);	
				}
			
				instance_destroy();
			}
		}
		else {
			draw_char = text_length[page];
		}
}
#endregion

#region  ----------draw textbox ----------
if (instance_exists(obj_battle)) {
	battle_y_offset = 10;
}
else {
	battle_y_offset = 0;	
}

var _textb_x = textbox_x + text_x_offset[page];
var _textb_y = textbox_y + battle_y_offset;

textb_img += textb_img_speed;
textb_spr_w = sprite_get_width(textb_spr[page]);
textb_spr_h = sprite_get_height(textb_spr[page]);

nametext_img += nametext_spd;

if (speaker_sprite[page] != noone) {
	sprite_index = speaker_sprite[page];
	if (draw_char == text_length[page]) {
		image_index = 0;	
	}
	
	var _speaker_x = textbox_x + portrait_x_offset[page];
	var _nametext_side = nametext_x_left;
	
	//right
	if (speaker_side[page] == -1) {
		_speaker_x += sprite_width;
		_nametext_side = nametext_x_right;
	}
	
	//nametext_line_width = _nametext_side - nametext_border * 2
	
	draw_sprite_ext(textb_spr[page], textb_img, textbox_x + portrait_x_offset[page], textbox_y + battle_y_offset, sprite_width/textb_spr_w, sprite_height/textb_spr_h, 0, c_white, 1);
	draw_sprite_ext(sprite_index, image_index, _speaker_x, textbox_y + battle_y_offset - 2, speaker_side[page], 1, 0, c_white, 1);
	draw_sprite_ext(textb_spr[page], nametext_img, _nametext_side, nametext_y + battle_y_offset, nametext_width, nametext_height, 0, c_white, 1);
	
	if (name_text[page] != noone) {
	//draw_text_ext_color(_nametext_side, nametext_y, name_text[page], nametext_line_sep, nametext_line_width, c_white, c_white, c_white, c_white, 1);
		draw_set_halign(fa_center);
		draw_text(_nametext_side + nametext_border, nametext_y + battle_y_offset + 9, name_text[page]);
	}
	
	draw_set_halign(fa_left);
	
}

draw_sprite_ext(textb_spr[page], textb_img, _textb_x, _textb_y, textbox_width / textb_spr_w, textbox_height / textb_spr_h, 0, c_white, 1);

#region ---------options--------------

if (draw_char == text_length[page]) && (page == page_number - 1) {
	
	//option selection
	option_pos += keyboard_check_pressed(global.controls_down) - keyboard_check_pressed(global.controls_up);
	option_pos = clamp(option_pos, 0, option_number - 1);
	
	//draw the options
	var _op_space = 30;
	var _op_border = 18;
	var _op_x_offset = 32;
	for (var op = 0; op < option_number; op++) {
		//option box
		var _op_w = string_width(option[op]) + _op_border * 2;
		draw_sprite_ext(textb_spr[page], textb_img, _textb_x + _op_x_offset, _textb_y - _op_space * option_number + _op_space * op, _op_w / textb_spr_w, (_op_space - 5) / textb_spr_h, 0, c_white, 1);
		
		//arrow
		if (option_pos == op) {
			draw_sprite(spr_textbox_arrow, 0, _textb_x, _textb_y - _op_space * option_number + _op_space * op);
		}
		
		//option text
		draw_text(_textb_x + _op_x_offset + _op_border, _textb_y - _op_space * option_number + _op_space * op + 6, option[op]);
		
		//option pick sound
		if (keyboard_check_pressed(global.controls_down)) || (keyboard_check_pressed(global.controls_up)) {
			audio_play_sound(snd_select, 6, false);	
		}
	}
	
}

#endregion

for (var c = 0; c < draw_char; c++) {
	
	//-----special stuff lol-----\\
	
	//wave text
	var _float_y = 0;
	if (float_text[c, page] == true) {
		float_dir[c, page] += -6;
		_float_y = dsin(float_dir[c, page]) * 1;
	}
	
	//shake text
	var _shake_x = 0;
	var _shake_y = 0;
	if (shake_text[c, page] == true) {
		shake_timer[c, page] --;
		if (shake_timer[c, page] <= 0) {
			shake_timer[c, page] = irandom_range(4, 8);
			shake_dir[c, page] 	= irandom(360);
		}
		if (shake_timer[c, page] <= 2) {
			_shake_x = lengthdir_x(1, shake_dir[c, page]);
			_shake_y = lengthdir_y(1, shake_dir[c, page]);
		}
	}
	
	
	//normal text
	draw_text_color(char_x[c, page] + _shake_x, char_y[c, page] + battle_y_offset + _float_y + _shake_y, char[c, page], col_1[c, page], col_2[c, page], col_3[c, page], col_4[c, page], 1);
}

#endregion

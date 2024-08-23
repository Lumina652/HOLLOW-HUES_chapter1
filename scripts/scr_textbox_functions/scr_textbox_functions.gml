//[XYZ] - optional

function scr_set_default_for_text() {
	line_break_pos[0, page_number] = 999;
	line_break_num[page_number] = 0;
	line_break_offset[page_number] = 0;
	
	textb_spr[page_number] = spr_text_box;
	speaker_sprite[page_number] = noone;
	speaker_side[page_number] = 1;
	
	snd[page_number] = snd_test;
	
	//variables for every letter/character
	for (var c = 0; c < 500; c++) {
		col_1[c, page_number] = c_white;
		col_2[c, page_number] = c_white;
		col_3[c, page_number] = c_white;
		col_4[c, page_number] = c_white;
		
		float_text[c, page_number] = false;
		float_dir[c, page_number] = c*20;
		
		shake_text[c, page_number] = false;
		shake_dir[c, page_number] = irandom(360);
		shake_timer[c, page_number] = irandom(3);
	}
}



//-------------TEXT VFX-------------\\
/// @param 1st_char 
/// @param last_char
/// @param color_1
/// @param color_2
/// @param color_3
/// @param color_4
function scr_text_color(_start, _end, _col1, _col2, _col3, _col4) {
	for (var c = _start; c <= _end; c++) {
		col_1[c, page_number - 1] = _col1;	
		col_2[c, page_number - 1] = _col2;	
		col_3[c, page_number - 1] = _col3;	
		col_4[c, page_number - 1] = _col4;
	}
}

/// @param 1st_char 
/// @param last_char
function scr_text_float(_start, _end) {
	for (var c = _start; c <= _end; c++) {
		float_text[c, page_number - 1] = true;
	}
}

/// @param 1st_char 
/// @param last_char
function scr_text_shake(_start, _end) {
	for (var c = _start; c <= _end; c++) {
		shake_text[c, page_number - 1] = true;
	}
}


/// @param text
/// @param [character]
/// @param [side]
function scr_text(_text){

scr_set_default_for_text();

text[page_number] = _text;

//get character info
if (argument_count > 1) {
	switch(argument[1]) {
		
		//GASTER UNDERTALE WHATTA??!??!?!
		case "test character":
			speaker_sprite[page_number] = spr_test_portrait0;
			textb_spr[page_number] = spr_text_box2;
			snd[page_number] = snd_malachi;
			break;
		case "test character - happy":
			speaker_sprite[page_number] = spr_test_portrait1;
			textb_spr[page_number] = spr_text_box2;
			snd[page_number] = snd_malachi;
			break;
		
		//B a  l    l
		case "ball":
			speaker_sprite[page_number] = spr_test_portrait2;
			textb_spr[page_number] = spr_text_box;
			snd[page_number] = snd_test;
			break;
			
			
		//Malachi
		case "Malachi": //No portrait
			//speaker_sprite[page_number] = spr_test_portrait0;
			speaker_sprite[page_number] = spr_portrait_malachi;
			textb_spr[page_number] = spr_text_box_malachi;
			snd[page_number] = snd_malachi_1;
			name_text[page_number] = "Malachi";
			break;
		//Sal Narrator
		case "Sal": //No portrait
			//speaker_sprite[page_number] = spr_test_portrait0;
			textb_spr[page_number] = spr_text_box_sal;
			snd[page_number] = snd_sal;
			break;
		
		//Aster 
		case "Aster - normal":
			speaker_sprite[page_number] = spr_portrait_test_a;
			textb_spr[page_number] = spr_text_box_aster;
			snd[page_number] = snd_sal;
			name_text[page_number] = "Aster";
			break;
		
		//Rose 
		case "Rose - normal":
			speaker_sprite[page_number] = spr_portrait_test_r;
			textb_spr[page_number] = spr_text_box_rose;
			snd[page_number] = snd_sal;
			name_text[page_number] = "Rose";
			break;
		
		//Hazel
		case "Hazel - normal":
			speaker_sprite[page_number] = spr_portrait_test_h;
			textb_spr[page_number] = spr_text_box_hazel;
			snd[page_number] = snd_sal;
			name_text[page_number] = "Hazel";
			break;
	}
}

//side the character is on: 1 = left || -1 = right
if (argument_count > 2) {
	speaker_side[page_number] = argument[2];
}

page_number ++;

}

/// @param text
/// @option link_id
function scr_option(_option, _link_id) {
	with (obj_text_box) {
		option[option_number] = _option;
		option_link_id[option_number] = _link_id;
	
		option_number ++;
	}
}

/// @param text_id
function scr_create_textbox(_text_id) {
	if (!instance_exists(obj_text_box)) || (obj_text_box.option_number > 0) {
		with (instance_create_depth(0, 0, -99999, obj_text_box)) {
			scr_game_script(_text_id);
		}
	}
}
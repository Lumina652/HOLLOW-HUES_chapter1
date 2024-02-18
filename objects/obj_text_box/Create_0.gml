depth = -99999;

//scr_text("sram");

#region textbox parameters
textbox_width = 440;
textbox_height = 140;
border = 18;
line_sep = 24;
line_width = textbox_width - border * 2;
textb_img = 0;
textb_img_speed = 6 / room_speed;
#endregion
#region text
page = 0;
page_number = 0;
text[0] = "";
text_length[0] = string_length(text[0]);
char[0, 0] = "";
char_x[0, 0] = 0;
char_y[0, 0] = 0;
draw_char = 0;
text_spd = 1;
#endregion
#region options
option[0] = "";
option_link_id[0] = -1;
option_pos = 0;
option_number = 0;
#endregion
setup = false;
#region effects
scr_set_default_for_text();
last_free_space = 0;
text_pause_timer = 0;
text_pause_time = 16;
#endregion
#region sound
snd_delay = 3;
snd_count = snd_delay;
#endregion

//show_debug_message(page);
//show_debug_message(page_number);
//show_debug_message(text);
//show_debug_message(text_length);
//show_debug_message(char);
//show_debug_message(draw_char);
//show_debug_message(option);
//show_debug_message(option_link_id);
//show_debug_message(option_pos);
//show_debug_message(option_number);
//

//option link id: -1
//page: 0
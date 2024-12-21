anim_run += 6 / room_speed;
//bg
draw_sprite(battle_background, 0, x, y);
//draw_text(x, y, string(obj_music.target_song_asset));

//units
var _unit_with_current_turn = unit_turn_order[turn].id;
for (var i = 0; i < array_length(unit_render_order); i++) {
	with (unit_render_order[i]) {
		draw_self();	
	}
}

//ui boxes
draw_sprite_stretched(spr_text_box_inv, anim_run, 0+x, 320+y, 20*9, 20*8);
draw_sprite_stretched(spr_text_box_inv, anim_run, 180+x, 320+y, 20*23, 20*8);

//headings
scr_draw_set_text(c_gray, global.font_main, fa_left, fa_top);
draw_text(x+text_enemy_x, y+text_header_y, "ENEMY");
draw_text(x+text_name_x, y+text_header_y, "NAME");
draw_text(x+text_hp_x, y+text_header_y, "HP");
draw_text(x+text_mana_x, y+text_header_y, "MANA");

//enemy names
draw_set_color(c_white);
var _drawLimit = 5;
var _drawn = 0;

for (var i = 0; (i < array_length(enemy_units)) && (_drawn < _drawLimit); i++) {
	var _char = enemy_units[i];	
	if (_char.hp > 0) {
		_drawn++;
		draw_set_color(c_white);
		if (_char.id == _unit_with_current_turn) draw_set_color(c_yellow);
		draw_text(x+text_enemy_x, y+text_enemy_name_y+(i*20), _char.name);
	}
}

//party info
for (var i = 0; i < array_length(party_units); i++) {
	//name
	draw_set_color(c_white);
	var _char = party_units[i];
	if (_char.id == _unit_with_current_turn) draw_set_color(c_yellow);
	if (_char.hp <= 0) draw_set_color(c_red);
	draw_text(x+text_name_x, y+text_enemy_name_y+(i*20), _char.name);
	//hp
	draw_set_color(c_white);
	if (_char.hp < (_char.hpMax * 0.5)) draw_set_color(c_orange);
	if (_char.hp <= 0) draw_set_color(c_red);
	draw_text(x+text_hp_x, y+text_enemy_name_y+(i*20), string(_char.hp) + "/" + string(_char.hpMax));
	//mana
	draw_set_color(c_white);
	if (_char.mana < (_char.manaMax * 0.5)) draw_set_color(c_orange);
	if (_char.mana <= 0) draw_set_color(c_red);
	draw_text(x+text_mana_x, y+text_enemy_name_y+(i*20), string(_char.mana) + "/" + string(_char.manaMax));
}

//draw the cursor :0 :3 :D
if (cursor.active) {
	with (cursor) {
		if (active_target != noone) {
			if (!is_array(active_target)) { //single target
				draw_set_alpha(sin(get_timer()/50000)+1);
				draw_sprite(spr_arrow_left_sal, 0, active_target.x, active_target.y);
				with (active_target) {
					shader_set(sh_whiteflash);	
				}
				draw_set_alpha(1.0);
				shader_reset();
			}
			else { //all targets
				draw_set_alpha(sin(get_timer()/50000)+1);
				for (var i = 0; i < array_length(active_target); ++i) {
				    draw_sprite(spr_arrow_left_sal, 0, active_target[i].x, active_target[i].y);
					with (active_target[i]) {
						shader_set(sh_whiteflash);	
					}
				}
				draw_set_alpha(1.0);
				shader_reset();
			}
		}
	}
}

//battle text
if (battle_text != "") {
	draw_sprite_stretched(spr_text_box_inv, anim_run, x + 200, y+8,20*12,20*3.5);
	scr_draw_set_text(c_white, global.font_main, fa_center, fa_center);
	draw_text((x+200) + 120, (y+8) + 35 , battle_text);
}
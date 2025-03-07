//show_debug_message(target_hueshift_value);

anim_run += 6 / room_speed;
//bg
draw_sprite(battle_background, 0, x, y);

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
	if (_char.id == _unit_with_current_turn) {
		if (cursor.active) {
			with (cursor) {
				if (active_action.manaCost > 0) {
					draw_set_color(c_yellow);	
				}
			}
		}
	}
	draw_text(x+text_mana_x, y+text_enemy_name_y+(i*20), string(_char.mana) + "/" + string(_char.manaMax));
}

var _char_portrait =_unit_with_current_turn;
if (_char_portrait != obj_battle_unit_enemy) {
	//stats rims
	draw_sprite_ext(spr_inv_frame, 0, 260 + x, 420 + y, 5.7, 0.7, 0, c_white, 1);
	draw_sprite_ext(spr_inv_frame, 0, 260 + x, 450 + y, 5.7, 0.7, 0, c_white, 1);
		
	//HP AND MANA
	draw_sprite_ext(spr_health, 0, 260 + 2 + x, 420 + 2 + y, (_char_portrait.hp / _char_portrait.hpMax) * 110, 1, 0, c_white, 1);
	draw_sprite_ext(spr_mana, 0, 260 + 2 + x, 450 + 2 + y, (_char_portrait.mana / _char_portrait.manaMax) * 110, 1, 0, c_white, 1);

	//portrait
	draw_sprite_ext(_char_portrait.portrait_sprite, anim_run, x + 200, y + 420, 2.5, 2.5, 0, c_white, 1);
	draw_sprite(_char_portrait.portrait_sprite_char, 0, x + 212, y + 423);
}
//draw the cursor :0 :3 :D
if (cursor.active) {
	with (cursor) {
		if (active_target != noone) {
			if (!is_array(active_target)) { //single target
				with (active_target) {
					shader_set(sh_hue_white);
					obj_battle.target_hueshift_value = clamp(sin(get_timer()/90000) + 1, -999, 0.4);
					var _shader_alpha = shader_get_uniform(sh_hue_white, "uniform_val");
					shader_set_uniform_f(_shader_alpha, obj_battle.target_hueshift_value);
					draw_self();
					shader_reset();
				}
				
				//draw_set_alpha(sin(get_timer()/50000)+1);
				draw_sprite(spr_arrow_left_sal, 0, active_target.x, active_target.y);
				draw_set_alpha(1.0);
			}
			else { //all targets
				//draw_set_alpha(sin(get_timer()/50000)+1);
				for (var i = 0; i < array_length(active_target); ++i) {
				    with (active_target[i]) {
						shader_set(sh_hue_white);
						obj_battle.target_hueshift_value = clamp(sin(get_timer()/90000) + 1, -999, 0.4);
						var _shader_alpha = shader_get_uniform(sh_hue_white, "uniform_val");
						shader_set_uniform_f(_shader_alpha, obj_battle.target_hueshift_value);
						draw_self();
						shader_reset();
					}
					
					draw_sprite(spr_arrow_left_sal, 0, active_target[i].x, active_target[i].y);
				}
				draw_set_alpha(1.0);
			}
		}
	}
}

//battle text
if (battle_text != "") {
	draw_sprite_stretched(spr_text_box_inv, anim_run, x + 180, y+8,20*14,20*3.5);
	scr_draw_set_text(c_white, global.font_main, fa_center, fa_center);
	draw_text((x+200) + 120, (y+8) + 35 , battle_text);
}

if (mana_cost_text != "") {
	draw_sprite_stretched(spr_text_box_inv, anim_run, x, y+280, 20*5, 20*2);
	scr_draw_set_text(c_white, global.font_main, fa_left, fa_top);
	draw_text(x + 7, y + 294, "MANA: " + mana_cost_text);
}
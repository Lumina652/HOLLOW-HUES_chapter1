anim_run += 6 / room_speed;

draw_sprite(battle_background, 0, x, y);

draw_sprite_stretched(spr_text_box_inv, anim_run, 0, 320, 20*9, 20*8);
draw_sprite_stretched(spr_text_box_inv, anim_run, 180, 320, 20*23, 20*8);
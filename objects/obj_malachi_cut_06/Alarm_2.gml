obj_player_sal.hasControl = true;
obj_player_sal.in_cutscene = false;
obj_player_sal.whatCutscene = -1;
audio_play_sound(snd_malachi_teleport, 10, false);
instance_destroy(obj_malachi_glitch);
scr_NewEncounter([global.enemies.Malachi], spr_battle_bg_malachi, msc_sharp_advantage);
instance_destroy();
// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_inventory_get_item(){
	global.inventory[0] = object_index;
	audio_play_sound(snd_option_pick, 1, false);
}
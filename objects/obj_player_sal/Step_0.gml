////DEBUG
if (keyboard_check_pressed(ord("P"))) {
	global.party_money += 10;	
}

#region INPUT
if (hasControl) && (in_inv == 0) && (!instance_exists(obj_battle)) {
	key_left = keyboard_check(global.controls_left);
	key_right = keyboard_check(global.controls_right);
	key_up = keyboard_check(global.controls_up);
	key_down = keyboard_check(global.controls_down);
	if (canRun) {
		key_sprint = keyboard_check(global.controls_sprint);
	}
	else {
		key_sprint = 0;
	}
}
else {
	key_left = 0;
	key_right = 0;
	key_up = 0;
	key_down = 0;
	key_sprint = 0;
}

//&& (global.chapter != 0)
if (hasControl) && (in_text == 0) && (canInv) && (!instance_exists(obj_battle)) {
	key_inventory = keyboard_check_pressed(global.controls_inventory);
}
else {
	key_inventory = 0;	
}



#endregion
#region MOVEMENT
x = x + xspd;
y = y + yspd;

var xmove = key_right - key_left; 
var ymove = key_down - key_up;

if (!key_sprint) {
	xspd = (xmove * walkspd);
	yspd = (ymove * walkspd);
	image_speed = 1;
}
else {
	xspd = (xmove * runspd);
	yspd = (ymove * runspd);
	image_speed = 1 * 2.5;
}

#endregion
#region ANIMATION
	if (xspd > 0) {
		faceDir = playerAnims.RIGHT;
		with (obj_interact) {
			x = other.x + 16;
			y = other.y;
			image_angle = 0;
		}
	}
	if (xspd < 0) {
		faceDir = playerAnims.LEFT;
		with (obj_interact) {
			x = other.x - 16;
			y = other.y;
			image_angle = 0;
		}
	}

	if (yspd < 0) {
		faceDir = playerAnims.UP;
		with (obj_interact) {
			x = other.x;
			y = other.y - 16;
			image_angle = 90;
		}
	}
	if (yspd > 0) {
		faceDir = playerAnims.DOWN;
		with (obj_interact) {
			x = other.x;
			y = other.y + 16;
			image_angle = 90;
		}
	}

if (xspd == 0) && (yspd == 0) {
	image_speed = 0;
	image_index = 0;
}
else {
	if (hasControl) {
		sprite_index = sprite[faceDir];	
	}
}
#endregion
#region COLLISION
//Horizontal Collision
var _x_coll = place_meeting(x + xspd, y, obj_collidable) || place_meeting(x + xspd, y, obj_interactable) || place_meeting(x + xspd, y, obj_item_parent) || place_meeting(x + xspd, y, obj_armor_parent) || place_meeting(x + xspd, y, obj_weapon_parent) || place_meeting(x + xspd, y, obj_key_parent);
var _y_coll = (place_meeting(x, y + yspd, obj_collidable)) || (place_meeting(x, y + yspd, obj_interactable)) || (place_meeting(x, y + yspd, obj_item_parent)) || (place_meeting(x, y + yspd, obj_weapon_parent)) || (place_meeting(x, y + yspd, obj_armor_parent)) || (place_meeting(x, y + yspd, obj_key_parent));

if (_x_coll) {
	xspd = 0;	
}

//Vertical Collision
if (_y_coll) {
	yspd = 0;	
}

#endregion
#region ADDITIONAL EFFECTS (WALKING SFX)
if (image_index == 1) || (image_index == 3) {
	if (room = rm_malachi_0) || (room = rm_malachi_1) || (room = rm_malachi_2) {
		if (xspd != 0) {
			instance_create_layer(x, y + 10, "WalkingEffect", obj_ocean_walk);	
		}
		if (yspd != 0) {
			instance_create_layer(x, y + 10, "WalkingEffect", obj_ocean_walk);	
		}
		
		audio_play_sound(choose(snd_sand_0, snd_sand_1, snd_sand_2, snd_sand_3, snd_sand_4, snd_sand_5, snd_sand_6), 6, false, global.sound_volume * global.master_volume);
	}
}
#endregion
#region INVENTORY
if (key_inventory) {
	in_inv++;
}

if (in_inv == 1) {
	xspd = 0;
	yspd = 0;
	if (opened_inv == false) {
		instance_create_depth(x, y, -9999, obj_item_menu);
		opened_inv = true;
	}
}


if (in_inv > 1) {
	in_inv = 0;
	instance_destroy(obj_item_menu);
	opened_inv = false;
}

#endregion
#region HP AND MANA TRACKER
for (var i = 0; i < array_length(global.party); ++i) {
    if (global.party[i].hp > global.party[i].hpMax) global.party[i].hp = global.party[i].hpMax;
	if (global.party[i].mana > global.party[i].manaMax) global.party[i].mana = global.party[i].manaMax;
}
#endregion
#region FOLLOWERS
//update recordings
if (x != xprevious) || (y != yprevious) {
	for (var i = followers_array_size-1; i > 0; i--) {
		followers_pos_x[i] = followers_pos_x[i-1];
		followers_pos_y[i] = followers_pos_y[i-1];
		followers_to_record_sprite[i] = followers_to_record_sprite[i-1];
	}
	followers_pos_x[0] = x;
	followers_pos_y[0] = y;
	followers_to_record_sprite[0] = sprite_index;
	
}
#endregion
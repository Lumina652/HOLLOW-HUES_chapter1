#region INPUT
if (hasControl) {
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
	//key_inventory = keyboard_check_pressed(global.controls_inventory);
}
else {
	key_left = 0;
	key_right = 0;
	key_up = 0;
	key_down = 0;
	key_sprint = 0;
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
		}
	}
	if (xspd < 0) {
		faceDir = playerAnims.LEFT;
		with (obj_interact) {
			x = other.x - 16;
			y = other.y;
		}
	}

	if (yspd < 0) {
		faceDir = playerAnims.UP;
		with (obj_interact) {
			x = other.x;
			y = other.y - 16;
		}
	}
	if (yspd > 0) {
		faceDir = playerAnims.DOWN;
		with (obj_interact) {
			x = other.x;
			y = other.y + 16;
		}
	}

if (xspd == 0) && (yspd == 0) {
	image_speed = 0;
	image_index = 0;
}
else {
	sprite_index = sprite[faceDir];
}

#endregion
#region COLLISION
//Horizontal Collision
if (place_meeting(x + xspd, y, obj_collidable)) || (place_meeting(x + xspd, y, obj_interactable)) || (place_meeting(x + xspd, y, obj_item_parent)) {
	xspd = 0;	
}

//Vertical Collision
if (place_meeting(x, y + yspd, obj_collidable)) || (place_meeting(x, y + yspd, obj_interactable)) || (place_meeting(x, y + yspd, obj_item_parent)) {
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
		
		audio_play_sound(choose(snd_sand_0, snd_sand_1, snd_sand_2, snd_sand_3, snd_sand_4, snd_sand_5, snd_sand_6), 10, false);
	}
}
#endregion
#region INVENTORY
//if (key_inventory) && (inInventory == false) {
	//hasControl = false;
	//inInventory = true;
//}
#endregion
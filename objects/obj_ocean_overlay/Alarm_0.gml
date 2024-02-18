if (room != rm_malachi_2) {
	instance_create_layer(random_range(0, 640), random_range(0, 1200), "Bubbles", obj_ocean_bubbles);
}

alarm[0] = 0.5 * room_speed;
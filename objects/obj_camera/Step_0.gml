if (follow != noone)  {
	x_to = follow.x;
	y_to = follow.y;
}

x += (x_to - x) / cam_speed; // / 10;
y += (y_to - y) / cam_speed; // / 10;

x = clamp(x, cam_width/2, room_width - cam_width/2);
y = clamp(y, cam_height/2, room_height - cam_height/2);

camera_set_view_pos(view_camera[0], x - (cam_width * 0.5), y - (cam_height * 0.5));
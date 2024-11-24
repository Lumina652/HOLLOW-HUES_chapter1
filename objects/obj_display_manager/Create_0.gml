ideal_width = 0;
ideal_height = 480;

aspect_ratio = display_get_width() / display_get_height();

ideal_width = round(ideal_height * aspect_ratio);

if (ideal_width % 2 != 0) {
    ideal_width++;
}

for(var i = 1; i<=room_last; i++) {
	if (room_exists(i)) {
		camera_create_view(i,0,ideal_width,ideal_height,0,-1,-1,-1,0,0);
		room_set_view_enabled(i, true);
	}
}

surface_resize(application_surface, ideal_width, ideal_height);
window_set_size(ideal_width, ideal_height);

room_goto_next();
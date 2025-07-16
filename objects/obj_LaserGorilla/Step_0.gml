image_angle = direction;

life_time -= 1;

if (life_time <= 0) {
	with (obj_Gorilla) {
		global.current_combo = 0;
	}
	instance_destroy();
}
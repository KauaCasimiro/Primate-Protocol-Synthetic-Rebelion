var cam_x = camera_get_view_x(view_camera[0]);
var cam_y = camera_get_view_y(view_camera[0]);

if (instance_exists(obj_Gorilla)) {
	var target_x = obj_Gorilla.x - (camera_get_view_width(view_camera[0]) / 2);
	var target_y = obj_Gorilla.y - (camera_get_view_height(view_camera[0]) / 2);
	var lerp_speed = 0.1; // Ajuste: quanto menor, mais suave
	var new_x = lerp(cam_x, target_x, lerp_speed);
	var new_y = lerp(cam_y, target_y, lerp_speed);

	camera_set_view_pos(view_camera[0], new_x, new_y);
}


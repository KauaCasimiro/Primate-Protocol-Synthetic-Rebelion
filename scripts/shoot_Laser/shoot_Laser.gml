function shoot_Laser(){
	var offset_x = 20.5;
	var offset_y = 12.5;
	
	var px = x + offset_x;
    var py = y + offset_y;
    var mx = device_mouse_x_to_gui(0);
    var my = device_mouse_y_to_gui(0);
    var angle = point_direction(px, py, mx, my);

    var laser = instance_create_layer(px, py, "Instances", obj_LaserGorilla);
    laser.direction = angle;
    laser.speed = 12;
}
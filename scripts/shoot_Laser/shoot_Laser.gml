function shoot_Laser() {
    // Ponto da cruz vermelha na testa
    var px = x + 20.5;
    var py = y + 12.5;

    // Cursor
    var mx = device_mouse_x_to_gui(0);
    var my = device_mouse_y_to_gui(0);

    // Ângulo do tiro
    var angle = point_direction(px, py, mx, my);

    // Desloca o spawn do projétil um pouco pra frente da testa
    var offset = 4;
    px += lengthdir_x(offset, angle);
    py += lengthdir_y(offset, angle);

    // Cria projétil
    var laser = instance_create_layer(px, py, "Instances", obj_LaserGorilla);
    laser.direction = angle;
    laser.speed = 12;
}

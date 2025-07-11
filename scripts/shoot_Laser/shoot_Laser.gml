function shoot_Laser() {
    // Ponto de origem do disparo: testa do gorila (16px acima da origem central)
    var px;
    if (image_xscale > 0) {
        px = x + 16;
    } else {
        px = x - 16;
    }
    var py = y - 16;

    // Posição real do mouse no mundo da câmera
    var mx = camera_get_view_x(view_camera[0]) + window_mouse_get_x();
    var my = camera_get_view_y(view_camera[0]) + window_mouse_get_y();

    // Direção do disparo a partir do ponto de origem (px, py) até o mouse
    var angle = point_direction(px, py, mx, my);

    // Offset para spawnar o projétil um pouco à frente da testa
    var offset = 6;
    var spawn_x = px + lengthdir_x(offset, angle);
    var spawn_y = py + lengthdir_y(offset, angle);

    // Cria o projétil com direção e velocidade
    var laser = instance_create_layer(spawn_x, spawn_y, "Instances", obj_LaserGorilla);
    laser.direction = angle;
    laser.speed = 12;
}

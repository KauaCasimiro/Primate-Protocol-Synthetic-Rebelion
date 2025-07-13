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
    var mx = mouse_x;
    var my = mouse_y;

    // Direção do disparo a partir do ponto de origem (px, py) até o mouse
    var angle = point_direction(px, py, mx, my);

    // Cria o projétil com direção e velocidade
    var laser = instance_create_layer(x, y, "Instances", obj_LaserGorilla);
    laser.direction = angle;
    laser.speed = 12;
	
	audio_play_sound(snd_LaserGorilla,1,false);
}

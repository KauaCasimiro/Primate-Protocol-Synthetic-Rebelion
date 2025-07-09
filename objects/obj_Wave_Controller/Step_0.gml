// Cheat para pular de wave em debug (usando Numpad)
if (keyboard_check(vk_alt)) {

    var new_wave = -1;

    if (keyboard_check_pressed(vk_numpad1)) new_wave = 1;
    if (keyboard_check_pressed(vk_numpad2)) new_wave = 2;
    if (keyboard_check_pressed(vk_numpad3)) new_wave = 3;
    if (keyboard_check_pressed(vk_numpad4)) new_wave = 4;
    if (keyboard_check_pressed(vk_numpad5)) new_wave = 5;
    if (keyboard_check_pressed(vk_numpad6)) new_wave = 6;
    if (keyboard_check_pressed(vk_numpad7)) new_wave = 7;
    if (keyboard_check_pressed(vk_numpad8)) new_wave = 8;
    if (keyboard_check_pressed(vk_numpad9)) new_wave = 9;
    if (keyboard_check_pressed(vk_numpad0)) new_wave = 10;

    if (new_wave != -1) {
        // Destroi todos os inimigos da wave atual
        with (obj_Enemie) instance_destroy();

        // Reseta lista e estado
        spawn_list = [];
        wave = new_wave;
        state = "setup";

        show_debug_message("🧪 CHEAT ATIVADO: pulando direto para a Wave " + string(wave));
    }
}



switch(state) {
	case "setup":
	show_debug_message("🌀 Iniciando Wave " + string(wave));
	generate_Wave(wave);
	state = "spawning";
	break;
	
	case "spawning":
		if (array_length(spawn_list) > 0) {
				spawn_timer--;
				
				if (spawn_timer <= 0) {
					var enemy = array_pop(spawn_list);
					instance_create_layer(enemy.x, enemy.y, "Instances", enemy.obj);
					show_debug_message("👾 Spawnando: " + string(enemy.obj));
					spawn_timer = 30;
				}
			} else {
				show_debug_message("✅ Todos inimigos da wave " + string(wave) + " foram spawnados.");
				state = "waiting";
			}
			break;
			
	case "waiting":
	
	if (instance_number(obj_Enemie) == 0) {
		show_debug_message("☠️ Todos inimigos eliminados. Preparando próxima wave...");
		state = "next_wave";
		wait_timer = 60;
	}
	break;
	
	case "next_wave":
		//show_debug_message("⏳ Esperando próxima wave: " + string(wait_timer));

		wait_timer--;
		if (wait_timer == 30) {
			show_debug_message("🔄 Próxima wave chegando...");
		}
		if (wait_timer <= 0) {
			wave++;
			state = "setup";
		}
		break;
}
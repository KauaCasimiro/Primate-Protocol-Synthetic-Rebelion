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

        //show_debug_message("🧪 CHEAT ATIVADO: pulando direto para a Wave " + string(wave));
    }
}

var mx = device_mouse_x(0);
var my = device_mouse_y(0);

// limita mx para ficar dentro da largura da janela (0 até window_get_width())
mx = clamp(mx, 0, window_get_width() - 1);

// limita my para ficar dentro da altura da janela (0 até window_get_height())
my = clamp(my, 0, window_get_height() - 1);

// se o mouse saiu da janela, posiciona de volta dentro
if (device_mouse_x(0) != mx || device_mouse_y(0) != my) {
    window_mouse_set(mx, my);
}

// Incrementa o tempo enquanto a wave está ativa
if (wave_ativa) {
    if (array_length(wave_times) <= (wave - 1) || wave_times[wave - 1] == undefined) {
        wave_times[wave - 1] = 0;
    }
    wave_times[wave - 1] += delta_time / 1000000;
}

switch(state) {
    case "setup":
        ////show_debug_message("🌀 Iniciando Wave " + string(wave));

        // Garante que o array tem espaço para a wave atual
        if (array_length(wave_times) <= (wave - 1)) {
            array_resize(wave_times, wave);
        }
		
		enemies_killed_this_wave = 0;
		global.total_shots = 0;
		global.hits = 0;
		global.current_combo = 0;
		global.max_combo = 0;
		global.last_shot_time = 0;
		global.shot_intervals = [];

        // Zera o timer da wave atual
        wave_times[wave - 1] = 0;

        // Ativa o contador de tempo da wave
        //wave_ativa = true;

        generate_Wave(wave);
        state = "spawning";
        break;

    case "spawning":
        if (array_length(spawn_list) > 0) {
            spawn_timer--;

            if (spawn_timer <= 0) {
                var enemy = array_pop(spawn_list);
                instance_create_layer(enemy.x, enemy.y, "Instances", enemy.obj);
                ////show_debug_message("👾 Spawnando: " + string(enemy.obj));
				
				if (!wave_ativa) {
					wave_times[wave - 1] = 0;
					wave_ativa = true;
					//("⏱️ Timer da Wave " + string(wave) + " iniciado.");
				}
				
                spawn_timer = (array_length(spawn_list) > 15) ? 5 : 10;
            }
        } else {
            ////show_debug_message("✅ Todos inimigos da wave " + string(wave) + " foram spawnados.");
            // Não para a contagem aqui para contar enquanto o player luta
            state = "waiting";
        }
        break;

    case "waiting":
        if (instance_number(obj_Enemie) == 0) {
            wave_ativa = false; // Para a contagem quando a wave termina
			
			  // Calcula eficiência e nota antes de salvar
	        var time_taken = wave_times[wave - 1];
	        var enemies = enemies_killed_this_wave;
	        var efficiency = (time_taken > 0) ? (enemies / time_taken) : 0;
			var accuracy = (global.total_shots > 0) ? (global.hits / global.total_shots) : 0;

	        var grade;
	        if (efficiency >= 0.42 && accuracy >= 0.9) {
				grade = "S";
			} else if (efficiency >= 0.36 && accuracy >= 0.8) {
				grade = "A";
			} else if (efficiency >= 0.32 && accuracy >= 0.6) { 
				grade = "B";
			} else if (efficiency >= 0.28 && accuracy >= 0.5) {
				grade = "C";
			} else if (efficiency >= 0.24) { 
				grade = "D";
			} else {
				grade = "F";
			}

	        // Cria o registro da wave
	        var wave_data = {
	            wave: wave,
	            enemies_killed: enemies,
	            time: time_taken,
	            efficiency: efficiency,
				accuracy: accuracy,
				max_combo: global.max_combo,
	            grade: grade
	        };

			// Salva no array
			array_push(stats_wave, wave_data);

        /*show_debug_message("Wave " + string(wave) + " salva: " +
            "Enemies=" + string(enemies) + ", Time=" + string_format(time_taken, 1, 2) +
            ", Grade=" + grade);*/

			
            //show_debug_message("☠️ Todos inimigos eliminados. Preparando próxima wave...");
            state = "next_wave";
            wait_timer = 60;
        }
        break;

    case "next_wave":
        wait_timer--;
        if (wait_timer == 30) {
            //show_debug_message("🔄 Próxima wave chegando...");
        }
        if (wait_timer <= 0) {
            wave++;
            state = "setup";
        }
        break;
}

event_inherited();

var dist = point_distance(x, y, obj_Gorilla.x, obj_Gorilla.y); // distancia até o jogador

var dir_To_Player = point_direction(x, y, obj_Gorilla.x, obj_Gorilla.y); // direção do inimigo até o jogador

var angle_Diff = abs(angle_difference(image_angle, dir_To_Player)); // Diferença angular entre a direção que o inimigo está olhando e o jogador


// Verifica o campo de visão
if (dist < vision_Radius) {
		reset_timer = 0;
	if  (!has_Seen_Player) {
		//show_debug_message("👁️ Jogador detectado — iniciando delay.");
		has_Seen_Player = true;
		shot_Delay_Timer = delay_Before_Shoot;
	}
} else {
	if (has_Seen_Player) {
		
		reset_timer += 1;
		
		//show_debug_message("❌ Jogador saiu do campo de visão. Resetando.");
		
		if (reset_timer >= reset_timer_max) {
			//show_debug_message("❌ Jogador fora de visão por tempo demais. Resetando estado.");
		has_Seen_Player = false;
		shot_Delay_Timer = 0;
		shoot_Cooldown_Timer = 0;
		}
	}	
}

//Controle de delay e ataque

if (has_Seen_Player) {
	//Delay do primeiro tiro
	if (shot_Delay_Timer > 0) {
		//show_debug_message("Preparando tiro... Tempo restante: " + string(shot_Delay_Timer));
		shot_Delay_Timer -= 1;
	} else {
		//Cooldown entre tiros
		if (shoot_Cooldown_Timer <= 0) {
			//show_debug_message("💥 Atirando!");
			shoot_Bullet();
			shoot_Cooldown_Timer = shoot_Cooldown;
		} else {
			shoot_Cooldown_Timer -= 1;
		}
	}
}
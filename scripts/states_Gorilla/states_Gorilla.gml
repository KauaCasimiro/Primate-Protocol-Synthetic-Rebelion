function states_Gorilla(){
	#region States
		// Estado 'idle': gorila parado, esperando input para começar a andar
		function idle() {
			game_Functions();  // Chama funções gerais do jogo (input, colisões, etc)
			
			sprite_index = spr_Gorilla; // Define sprite de gorila parado
		
			// Se alguma tecla direcional for pressionada, muda para o estado 'walking'
			if (key_down || key_up || key_left || key_right) {
				state = "walking";
			}
		}
		
		// Estado 'walking': gorila se movendo na direção das teclas pressionadas
		function walking() {
			game_Functions();  // Atualiza funções gerais do jogo
			
			// Inverte o sprite horizontalmente conforme a direção horizontal (hspd)
			if (hspd != 0) {
				image_xscale = -sign(hspd);
			}			
			
			// Verifica se há movimento nas teclas horizontais e verticais
			var key = key_right - key_left != 0 || key_down - key_up != 0;
			
			// Calcula o ângulo de direção baseado na combinação das teclas pressionadas
			dir = point_direction(0,0, key_right - key_left, key_down - key_up);
			
			// Calcula o deslocamento horizontal (hspd) e vertical (vspd) baseado na velocidade e direção
			hspd = lengthdir_x(velocity * key, dir);
			vspd = lengthdir_y(velocity * key, dir);
			
			// Define sprite de caminhada
			sprite_index = spr_Gorilla_Walking;
			// image_speed = 0.2;  // (Comentado) controlaria a velocidade da animação
			
			if (place_meeting(x + hspd, y, obj_Wall)) {
				while(!place_meeting(x + sign(hspd), y, obj_Wall)) {
					x = x + sign(hspd);
				}
				hspd = 0;
			}
			
			// Aplica o deslocamento à posição do personagem
			x += hspd;
			
			if (place_meeting(x, y + vspd, obj_Wall)){
				while(!place_meeting(x, y+sign(vspd), obj_Wall)) {
					y = y + sign(vspd);
				}
				vspd = 0;
			}
			y += vspd;
			

			
			// Se o personagem parar de se mover, volta para o estado 'idle'
			if (hspd == 0 && vspd == 0) {
				state = "idle";
			}
			
			// Mostra mensagens de debug para velocidade vertical e horizontal
			//show_debug_message("VSPD: " + string(vspd));
			//show_debug_message("HSPD: " + string(hspd));
			
		}
		
		function stunned() {
			if (is_stunned) {
				stun_timer -= 1;
				var stun_total_time = 45;
				stun_effect_intensity = stun_timer/stun_total_time;
				
					if (stun_timer <= 0) {
						is_stunned = false
						stun_effect_intensity = 0;
						state = "idle";
					}

				// Interrompe inputs
				hspd = 0;
				vspd = 0;
				exit; // cancela o restante do step para congelar o jogador

			}
		}
	#endregion States
	
	#region state_Machine
		// Máquina de estados que chama a função correta conforme o estado atual
		switch(state) {
			case "idle": 
				idle();
				break;
		
			case "walking":
				walking();
				break;
			case "stunned":
				stunned();
				break;
		}
	#endregion state_Machine
	
		if (is_stunned) {
					var t = 1 - stun_effect_intensity;
					var r = lerp(0, 255, t);
					var g = 255;
					var b = 255;
					image_blend = make_color_rgb(r, g, b);
				} else {
					image_blend = c_white;
				}
}

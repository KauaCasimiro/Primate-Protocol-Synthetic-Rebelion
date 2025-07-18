if (hp_Gerency.hp <= 0 && !is_dead) {
	is_dead = true;
	flash_timer = 60;
	freeze_timer = 60;
	scr_end_stats();
}

if (is_dead) {
	hspd = 0;
	vspd = 0;
	
	// Impedir tiro
	can_shoot = false;
	shoot_timer = 0;

	if (flash_timer > 0) {
		flash_timer--;
	} else {
		image_blend = c_white;
	}
	
	if (freeze_timer > 0) {
		freeze_timer--;
	} else {
		audio_stop_sound(snd_Game);
		audio_play_sound(snd_HitGorilla, 1, false);
		instance_destroy();
		room_goto(End);
	}

	exit; // Sai do step e impede qualquer lógica depois
}
states_Gorilla();

if (damage_effect_timer > 0) {
    damage_effect_timer--;
}

energy_Gerency.gain_Energy(0.2);

#region Tiro a laser
	if (!can_shoot) {
		shoot_timer++;
		
		if (shoot_timer >= shoot_cooldown) {
			can_shoot = true;
			shoot_timer = 0;
			
		}
	}
	
	if (mouse_check_button(mb_left) && can_shoot){
		if (energy_Gerency.energy >= 10) {
			shoot_Laser();
			energy_Gerency.lose_Energy(10);
			can_shoot = false;
			shoot_timer = 0;
			
			global.total_shots += 1;
			
			var now = current_time/1000;
			if (global.last_shot_time != 0) {
				var interval = now - global.last_shot_time;
				array_push(global.shot_intervals, interval);
			}
			global.last_shot_time = now;
		} else {
			
		}
	}
#endregion Tiro a laser
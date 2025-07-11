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
		} else {
			
		}
	}
#endregion Tiro a laser

if (hp_Gerency.hp <= 0) {
    show_message("Você morreu.");
    scr_end_stats();
	game_end();
}
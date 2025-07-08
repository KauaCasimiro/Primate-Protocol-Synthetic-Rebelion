states_Gorilla();

#region Tiro a laser
	if (!can_shoot) {
		shoot_timer++;
		
		if (shoot_timer >= shoot_cooldown) {
			can_shoot = true;
			shoot_timer = 0;
		}
	}
	
	if (mouse_check_button(mb_left) && can_shoot){
		shoot_Laser();
		can_shoot = false;
		shoot_timer = 0;
	}
#endregion Tiro a laser
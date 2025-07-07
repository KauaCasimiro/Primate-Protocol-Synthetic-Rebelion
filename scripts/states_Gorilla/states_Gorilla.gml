function states_Gorilla(){
	#region States
		function idle() {
			game_Functions();
		
			if (key_down || key_up || key_left || key_right) {
				state = "walking";
				image_index = spr_Gorilla;
			}
		}
		
		function walking() {
			game_Functions();
			
			if (hspd != 0) {
				image_xscale = -sign(hspd);
			}			
			var key = key_right - key_left != 0 || key_down - key_up != 0;
			
			dir = point_direction(0,0, key_right - key_left, key_down - key_up);
			hspd = lengthdir_x(velocity * key, dir);
			vspd = lengthdir_y(velocity * key, dir);
			
			x = x + hspd;
			y = y + vspd;
			
		}
	#endregion States
	
	#region state_Machine
		switch(state) {
		case "idle": 
		idle();
		break;
		
		case "walking":
		walking();
		break
	}
	#endregion state_Machine
}
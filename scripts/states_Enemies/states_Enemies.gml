function states_Enemies(){
	#region States
		
		function follow_Player(){
			var angle = point_direction(x, y, obj_Gorilla.x, obj_Gorilla.y);
			
			x += lengthdir_x(spd, angle);
			y += lengthdir_y(spd, angle);
		}
		
	#endregion States
	
	#region states_Machine
		
		switch (state) {
			case "follow_Player":
				follow_Player();
				break;
		}
		
	#endregion states_Machine
	
}
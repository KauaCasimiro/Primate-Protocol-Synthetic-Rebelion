event_inherited();

if (place_meeting(x, y, obj_Gorilla)) {
	var inst_Player = instance_place(x, y, obj_Gorilla);
	if (inst_Player != noone) {
		inst_Player.is_stunned = true;
		inst_Player.stun_timer = 45;
		inst_Player.state = "stunned";
	}
}


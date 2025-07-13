// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function shoot_Bullet(){
	var angle = point_direction(x, y, obj_Gorilla.x, obj_Gorilla.y);
	var offset = 10;
	
	var laser_x = x +  lengthdir_x(offset, angle);
	var laser_y = y + lengthdir_y(offset, angle);
	
	show_debug_message("DISPARO! Ângulo: " + string(angle) + " | Pos: (" + string(laser_x) + ", " + string(laser_y) + ")");
	
	var laser = instance_create_layer(laser_x, laser_y, "Bullets", obj_LaserSecurity);
	laser.direction = angle;
	laser.image_angle = angle;
	laser.speed = 8;
	
	audio_play_sound(snd_LaserRobot, 1, false);
	
}
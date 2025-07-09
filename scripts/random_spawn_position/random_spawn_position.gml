// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function random_spawn_position(){
	
	var margin = 64;
	var side = irandom(3);
	var _x, _y;
	
	switch (side) {
		case 0: // Top
			_x = irandom_range(margin, room_width - margin);
			_y = -margin;
			break;
		case 1: // Bottom
			_x = irandom_range(margin, room_width - margin);
			_y = room_height + margin;
			break;
		case 2: // Left
			_x = -margin;
			_y = irandom_range(margin, room_height - margin);
			break;
		case 3: // Right
			_x = room_width + margin;
			_y = irandom_range(margin, room_height - margin);
			break;
	}

	return {x: _x, y: _y};
}
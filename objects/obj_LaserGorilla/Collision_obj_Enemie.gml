with(other) {
	instance_destroy();
}
instance_destroy();

global.hits += 1;
global.current_combo += 1;

if (global.current_combo > global.max_combo) {
		global.max_combo = global.current_combo;
	}

var wc = instance_find(obj_Wave_Controller, 0);
if (wc != noone) {
	wc.enemies_killed_this_wave += 1;
}
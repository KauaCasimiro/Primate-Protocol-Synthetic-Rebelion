instance_destroy();
instance_destroy(other);

var wc = instance_find(obj_Wave_Controller, 0);
if (wc != noone) {
	wc.enemies_killed_this_wave += 1;
}
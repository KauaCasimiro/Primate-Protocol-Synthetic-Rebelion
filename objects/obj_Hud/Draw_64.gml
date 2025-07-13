

var wc = instance_find(obj_Wave_Controller, 0);

var current_wave = 0;
var wave_times_local = [];

if (wc != noone) {
    current_wave = wc.wave;
    wave_times_local = wc.wave_times;
} else {
    // Opcional: mensagem de debug para indicar que o objeto não está presente
    // show_debug_message("obj_wave_control não encontrado na room!");
}

//Barra de vida e energia
if (instance_exists(obj_Gorilla)) {
	obj_Gorilla.hp_Gerency.draw_Hp(20, 20 , 180, 18);
	obj_Gorilla.energy_Gerency.draw_Energy(20, 50, 180, 12); // mais estreita
}


// HUD Wave
draw_set_font(fnt_cybr);
var wave_text = "Wave: " + string(current_wave);
var enemy_text = "Enemies: " + string(instance_number(obj_Enemie));

var time_text = "Time: ";

if (is_array(wave_times_local) && array_length(wave_times_local) > (current_wave - 1) && wave_times_local[current_wave - 1] != undefined) {
    time_text += string_format(wave_times_local[current_wave - 1], 1, 1) + "s";
} else {
    time_text += "0.0s";
}

var pad = 20;
var xpos = display_get_gui_width() - pad;
var ypos = 20;
var spacing = 25;

draw_set_halign(fa_right);
draw_set_valign(fa_top);
draw_set_color(c_orange);
//draw_set_font(-1);

draw_text(xpos, ypos, wave_text);
draw_text(xpos, ypos + spacing, enemy_text);
draw_text(xpos, ypos + spacing * 2, time_text);

if (sprite_exists(cursor_sprite)) {
    var mx = window_mouse_get_x();
    var my = window_mouse_get_y();
    draw_sprite(cursor_sprite, 0, mx, my);
}
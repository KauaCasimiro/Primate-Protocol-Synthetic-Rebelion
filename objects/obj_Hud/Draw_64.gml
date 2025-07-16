var wc = instance_find(obj_Wave_Controller, 0);

var current_wave = 0;
var wave_times_local = [];

if (wc != noone) {
    current_wave = wc.wave;
    wave_times_local = wc.wave_times;
} else {
    // Opcional: mensagem de debug para indicar que o objeto não está presente
    // //show_debug_message("obj_wave_control não encontrado na room!");
}

// Barra de vida e energia
if (instance_exists(obj_Gorilla)) {
    obj_Gorilla.hp_Gerency.draw_Hp(20, 20 , 180, 18);
    obj_Gorilla.energy_Gerency.draw_Energy(20, 50, 180, 12); // mais estreita
}

draw_set_font(fnt_cybr);
var wave_text = "Wave: " + string(current_wave);
var enemy_text = "Enemies: " + string(instance_number(obj_Enemie));

var time_text = "Time: ";

if (is_array(wave_times_local) && array_length(wave_times_local) > (current_wave - 1) && wave_times_local[current_wave - 1] != undefined) {
    // Limita timer a 2 casas decimais
    time_text += string_format(wave_times_local[current_wave - 1], 1, 2) + "s";
} else {
    time_text += "0.0s";
}

// Cálculo de precisão (accuracy)
var shots = max(1, global.total_shots); // evita divisão por zero
var accuracy = (global.hits / shots) * 100;

// Combo atual
var current_combo = global.current_combo;

var pad = 20;
var xpos = display_get_gui_width() - pad;
var ypos = 20;
var spacing = 25;

draw_set_halign(fa_right);
draw_set_valign(fa_top);

var _pad_x = 12; // padding horizontal
var _pad_y = 8;  // padding vertical
var _lines = 5;  // número de linhas de texto

var _xpos = xpos;  // seu xpos já definido
var _ypos = ypos;  // seu ypos já definido
var _spacing = spacing; // seu spacing já definido

// Calcula altura total do retângulo (linhas * espaçamento) + padding vertical
var _rect_height = (_lines - 1) * _spacing + string_height("A") + _pad_y * 2;

// Textos usados para calcular largura
var _texts = [
    "Wave: " + string(current_wave),
    "Enemies: " + string(instance_number(obj_Enemie)),
    "Time: " + ((is_array(wave_times_local) && array_length(wave_times_local) > (current_wave - 1) && wave_times_local[current_wave - 1] != undefined) ? string_format(wave_times_local[current_wave - 1], 1, 2) + "s" : "0.0s"),
    "Accuracy: " + string_format(accuracy, 1, 2) + "%",
    "Combo: " + string(current_combo)
];

var _max_width = 0;
for (var i = 0; i < array_length(_texts); i++) {
    var w = string_width(_texts[i]);
    if (w > _max_width) _max_width = w;
}

// Desenha retângulo preto semi-transparente atrás do texto
draw_set_alpha(0.5);
draw_set_color(c_black); // 60% opacity
draw_rectangle(_xpos - _max_width - _pad_x, _ypos - _pad_y/2, _xpos + _pad_x/2, _ypos + _rect_height - _pad_y/2, false);
draw_set_alpha(1);

draw_set_color(c_white);

draw_text(xpos, ypos, wave_text);
draw_text(xpos, ypos + spacing, enemy_text);
draw_text(xpos, ypos + spacing * 2, time_text);

// Aqui adiciona precisão e combo, accuracy limitado a 2 casas decimais
draw_text(xpos, ypos + spacing * 3, "Accuracy: " + string_format(accuracy, 1, 2) + "%");
draw_text(xpos, ypos + spacing * 4, "Combo: " + string(current_combo));

if (sprite_exists(cursor_sprite)) {
    var mx = window_mouse_get_x();
    var my = window_mouse_get_y();
    draw_sprite(cursor_sprite, 0, mx, my);
}

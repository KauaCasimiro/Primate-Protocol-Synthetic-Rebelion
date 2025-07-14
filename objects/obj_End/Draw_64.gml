// 🔁 Acesso aos dados
var best = global.best_wave;
var worst = global.worst_wave;

// ⚠️ Verificação de segurança
if (is_undefined(best) || is_undefined(worst)) {
    draw_set_font(fnt_cybr);
    draw_set_color(c_white);
    draw_text(100, 200, "Nenhuma wave registrada.");
    return;
}

// 🧾 Formatando blocos
var msg_best =
    "MELHOR WAVE:\n" +
    "- Wave: " + string(best.wave) + "\n" +
    "- Inimigos Eliminados: " + string(best.enemies_killed) + "\n" +
    "- Tempo: " + string_format(best.time, 1, 2) + "s\n" +
    "- Nota: " + best.grade;

var msg_worst =
    "PIOR WAVE:\n" +
    "- Wave: " + string(worst.wave) + "\n" +
    "- Inimigos Eliminados: " + string(worst.enemies_killed) + "\n" +
    "- Tempo: " + string_format(worst.time, 1, 2) + "s\n" +
    "- Nota: " + worst.grade;

// 🎯 Posições de texto
var x_best = 100;
var x_worst = 450;
var __y = 200;

// 📦 Fundo de contraste (sem preenchimento total, estilo caixa de HUD)
draw_set_alpha(0.5);
draw_set_color(c_black);
draw_rectangle(x_best - 20, __y - 20, x_worst + 250, y + 120, false); // borda total
draw_set_alpha(1);

// 🎨 Configurações de texto
draw_set_font(fnt_cybr);
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

// 🖊️ Desenho dos blocos de texto
draw_text(x_best, y, msg_best);
draw_text(x_worst, y, msg_worst);

/*********************************************************************/

// 🔧 Configurações iniciais
draw_set_valign(fa_top);
draw_set_halign(fa_left);

var spacing = 40; // Espaçamento horizontal entre as opções
var _y = 500;      // Posição vertical do menu

// 🧮 Calcular a largura total do menu
var total_width = 0;

for (var i = 0; i < array_length(menu); i++) {
    draw_set_font(fnt_cybr); // Fonte padrão para medição
    total_width += string_width(menu[i].text);
    if (i < array_length(menu) - 1) {
        total_width += spacing;
    }
}

// 🎯 Calcular a posição X inicial (centralizado na tela de 800px)
var start_x = 400 - (total_width / 2);

// 🖊️ Desenhar as opções do menu com espaçamento proporcional
for (var i = 0; i < array_length(menu); i++) {
    var _text = menu[i].text;
    var _color = c_white;
    var _font = fnt_cybr;

    if (i == current) {
        _color = c_yellow;
        _font = fnt_cybr_Size;
    }

    draw_set_color(_color);
    draw_set_font(_font);
    draw_text(start_x, _y, _text);

    // ⏩ Avançar para a próxima posição, com base na largura do texto atual + espaçamento
    start_x += string_width(_text) + spacing;
}

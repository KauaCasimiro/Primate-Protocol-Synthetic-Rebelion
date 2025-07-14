function scr_end_stats() {
    var wc = instance_find(obj_Wave_Controller, 0);

    if (wc == noone || array_length(wc.stats_wave) == 0) {
        global.best_wave = undefined;
        global.worst_wave = undefined;
        return;
    }

    var stats = wc.stats_wave;

    var best = stats[0];
    var worst = stats[0];

    for (var i = 1; i < array_length(stats); i++) {
        var wave_data = stats[i];

        if (wave_data.efficiency > best.efficiency) {
            best = wave_data;
        }

        if (wave_data.efficiency < worst.efficiency) {
            worst = wave_data;
        }
    }

    // 💾 Armazena os dados em variáveis globais
    global.best_wave = best;
    global.worst_wave = worst;
}

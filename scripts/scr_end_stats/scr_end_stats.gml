function scr_end_stats() {
    var wc = instance_find(obj_Wave_Controller, 0);

    if (wc == noone || array_length(wc.stats_wave) == 0) {
        show_message("Nenhuma wave foi registrada.");
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

    var msg = " Melhor Wave:\n" +
              "- Wave: " + string(best.wave) + "\n" +
              "- Inimigos Eliminados: " + string(best.enemies_killed) + "\n" +
              "- Tempo: " + string_format(best.time, 1, 2) + "s\n" +
              "- Nota: " + best.grade + "\n\n" +

              " Pior Wave:\n" +
              "- Wave: " + string(worst.wave) + "\n" +
              "- Inimigos Eliminados: " + string(worst.enemies_killed) + "\n" +
              "- Tempo: " + string_format(worst.time, 1, 2) + "s\n" +
              "- Nota: " + worst.grade;

    show_message(msg);
}

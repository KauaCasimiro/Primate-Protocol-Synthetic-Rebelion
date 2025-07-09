// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function generate_Wave(w){
	 // Debug do valor recebido
    show_debug_message("Generating wave: " + string(w));

    var base = 5;
    var total = base + (w - 1) * 2;

    // Proporções base (ajuste conforme quiser)
    var prop_cleaners = 0.5;
    var prop_securitys = 0.3;
    var prop_drones = 0.2;

    // Define quais inimigos estão desbloqueados na wave
    var securitys_unlocked = (w >= 3);
    var drones_unlocked = (w >= 6);

    // Soma das proporções ativas
    var prop_sum = prop_cleaners;
    if (securitys_unlocked) prop_sum += prop_securitys;
    if (drones_unlocked) prop_sum += prop_drones;

    // Normaliza as proporções para somar 1
    var norm_cleaners = prop_cleaners / prop_sum;
    var norm_securitys = securitys_unlocked ? (prop_securitys / prop_sum) : 0;
    var norm_drones = drones_unlocked ? (prop_drones / prop_sum) : 0;

    // Calcula a quantidade de cada inimigo baseado nas proporções normalizadas
    var cleaners = floor(total * norm_cleaners);
    var securitys = floor(total * norm_securitys);

    // Garante que drones sejam zero caso não desbloqueados
    var drones = drones_unlocked ? total - cleaners - securitys : 0;

    // Gera spawn_list
    spawn_list = [];

    for (var i = 0; i < cleaners; i++) {
        var pos = random_spawn_position();
        array_push(spawn_list, {obj: obj_Cleaner, x: pos.x, y: pos.y});
    }
    for (var i = 0; i < securitys; i++) {
        var pos = random_spawn_position();
        array_push(spawn_list, {obj: obj_Security, x: pos.x, y: pos.y});
    }
    for (var i = 0; i < drones; i++) {
        var pos = random_spawn_position();
        array_push(spawn_list, {obj: obj_Drone, x: pos.x, y: pos.y});
    }

    show_debug_message("🛠️ Wave " + string(w) + " gerada:");
    show_debug_message("Cleaners: " + string(cleaners));
    show_debug_message("Securitys: " + string(securitys));
    show_debug_message("Drones: " + string(drones));
    show_debug_message("Total: " + string(array_length(spawn_list)));
}
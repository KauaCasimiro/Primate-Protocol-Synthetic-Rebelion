// Se a flag está ativa, verifica se algum som está tocando no jogo todo
if (global.robot_voice_playing) {
    if (!audio_is_playing(voice_ID)) {
        global.robot_voice_playing = false;
    }
}

if (keyboard_check_pressed(vk_right)){
	current++
}

if (keyboard_check_pressed(vk_left)) {
	current--
}

current = clamp(current, 0, array_length(menu) - 1);

if (keyboard_check_pressed(vk_enter)) {
	menu[current]._function();
}

if (!audio_is_playing(snd_Over)) {
    audio_play_sound(snd_Over, 1, true); // toca com looping
}
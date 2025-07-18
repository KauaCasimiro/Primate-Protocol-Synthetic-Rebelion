option1 = {
	text: "Again",
	
	_function: function () {
		room_goto(Game);
	},
}
option2 = {
	text: "Exit",
	
	_function: function () {
		game_end();
	},
}

menu = [option1, option2];

current = 0;

if (!audio_is_playing(snd_Over)) {
    audio_play_sound(snd_Over, 1, true); // Loop = true
}

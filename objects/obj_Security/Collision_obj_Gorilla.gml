event_inherited();
audio_play_sound(snd_ExplosionRobot, 1, false);
//instance_destroy(other)
other.hp_Gerency.lose_Hp(10); // ou outro valor
other.damage_effect_timer = other.damage_effect_duration;
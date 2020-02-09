/// @description Audio stuff

if (!audio_is_playing(snd_backNoise)) {
	audio_play_sound(snd_backNoise, 1.0, true);
}

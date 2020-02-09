/// @description Insert description here
// You can write your code in this editor
if (room == Level11 && !king_rip) {
	if (audio_is_playing(snd_backNoise)) audio_stop_sound(snd_backNoise);
	if (!audio_is_playing(snd_kAmb)) audio_play_sound(snd_kAmb, 1, true);
}
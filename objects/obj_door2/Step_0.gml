/// @description Insert description here
// You can write your code in this editor
if (place_meeting(x, y, obj_player)) {
	image_speed = 1;
	if (!soundPlayed) {
		audio_play_sound(snd_doorOpen, 1, false);
		soundPlayed = true;
	}
	if (keyboard_check_pressed(ord("S"))) {
		obj_transition.transition = true;	
	}
}



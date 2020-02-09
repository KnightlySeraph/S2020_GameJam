if(place_meeting(x,y,obj_solid)) instance_destroy();
if(place_meeting(x,y,obj_player)) {
	if(!obj_player.invin) obj_player.hurt = true;
	instance_destroy();
}

// Audio
if (!audio_is_playing(snd_dagger) && distance_to_object(obj_player) < 1000) audio_play_sound(snd_dagger, 0.7, false);
direction = point_direction(x,y,obj_player.x, obj_player.y);
speed = 5;
image_angle = random_range(0,360);

// Play the fire sound once
audio_play_sound(snd_rookShoot, 0.5, false);
randomize();

timer = 0;

image_angle = choose(0,90,180,270);

spd = 5;
hsp = 0;
vsp = 0;

offset = 192;

switch(image_angle) {
	case(0):
		x = obj_player.x + offset;
		y = obj_player.y + offset;
		hsp = -1;
		vsp = -1;
		break;
		
	case(90):
		x = obj_player.x + offset;
		y = obj_player.y - offset;
		hsp = -1;
		vsp = +1;
		break;
		
	case(180):
		x = obj_player.x - offset;
		y = obj_player.y - offset;
		hsp = +1;
		vsp = +1;
		break;
		
	case(270):
		x = obj_player.x - offset;
		y = obj_player.y + offset;
		hsp = +1;
		vsp = -1;
		break;
}

image_xscale = 0.5;
image_yscale = 0.5;

damage_box = noone;

// Audio
audio_play_sound(snd_warp, 1, false);
switch(state) {
	case "IDLE":
		break;
	
	case "WALK":
		if(vsp==0) hsp = spd * -direct;
		break;
		
	case "ATTACK":
		break;
		
	case "DEATH":
		break;
		
	case "HOLLOW":
		break;
}

vsp += grav;


if(place_meeting(x+hsp,y, obj_solid)) {
	while(!place_meeting(x+sign(hsp),y, obj_solid)) {
		x += sign(hsp);
	}
	hsp = 0;
	direct = -direct;
}

if(place_meeting(x,y+vsp, obj_solid)) {
	while(!place_meeting(x,y+sign(vsp), obj_solid)) {
		y += sign(vsp);
	}
	vsp = 0;
}

x+=hsp;
y+=vsp;

image_xscale = direct;

if(current_sprite != sprite_index) {
	current_sprite = sprite_index;
	image_index = 0;
}
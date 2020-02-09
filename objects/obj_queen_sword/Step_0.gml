if(sprite_index == spr_sword_still) {
	x += hsp * spd;
	y += vsp * spd;
	
	timer += 1;
	if(timer > ((offset*2)/spd)) sprite_index = spr_sword_dissappear;
}
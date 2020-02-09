if(sprite_index == spr_sword_still) {
	x += hsp * spd;
	y += vsp * spd;
	
	timer += 1;
	if(timer > ((offset*2)/spd)) sprite_index = spr_sword_dissappear;
	
	if(damage_box == noone) damage_box = instance_create_depth(x,y,depth,obj_enemy_damage);
	else {
		damage_box.x = x;
		damage_box.y = y;
		damage_box.image_xscale = 2;
		damage_box.image_yscale = 0.25;
		damage_box.image_angle = 135 + image_angle;
	}
}
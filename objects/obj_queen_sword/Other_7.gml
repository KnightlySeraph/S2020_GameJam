if(sprite_index == spr_sword_app) sprite_index = spr_sword_still;
if(sprite_index == spr_sword_dissappear) {
	scr_camShake(15, 15);
	instance_destroy();
}